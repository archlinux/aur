# Contributor: der_FeniX <derfenix@gmail.com>

pkgname=flite-fpic
_pkgname=flite
pkgver=2.0.0
_pkgver=2.0
pkgrel=1
pkgdesc="A lighweight version of festival speech synthesis compiled with -fPIC"
arch=('i686' 'x86_64')
url="http://www.speech.cs.cmu.edu/flite/"
license=('custom')
depends=('glibc' 'alsa-lib')
provides=('flite' 'flite-fpic')
replaces=('flite')
options=('!makeflags')
source=(http://www.festvox.org/flite/packed/${_pkgname}-${_pkgver}/${_pkgname}-${pkgver}-release.tar.bz2
        https://launchpad.net/ubuntu/+archive/primary/+files/${_pkgname}_${pkgver}-release-4.debian.tar.xz
	${pkgname}.patch)
sha256sums=('678c3860fd539402b5d1699b921239072af6acb4e72dc4720494112807cae411'
            'b4f4656f9bf397bb86d78721d87259629e53f3c0dd0fec10dd08b7750d0ffc3e'
            'adae4cba9c0af88ee1570bb3800ab8b826b9f6c60640ffce92b41871d54763e2')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"

  patches=(CVE-2014-0027_unsafe_temporary_file.patch
  exactly.patch
  flite.texi.patch
  no_rpath.patch
 shlib_deps.patch
 texi2html_to_texi2any_migration.patch
  ) 
  patch -Np1 -i ../${pkgname}.patch
   for patch in "${patches[@]}"; do
    patch -Np1 -i ../debian/patches/${patch}
  done

}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  CFLAGS="-fPIC -O3" ./configure --prefix=/usr

  #we want the 16k, not 8k voice
  sed -i 's/cmu_us_kal/cmu_us_kal16/' config/config

  #no parallel builds
  export MAKEFLAGS="-j1"
  make -j1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  make prefix="${pkgdir}/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
