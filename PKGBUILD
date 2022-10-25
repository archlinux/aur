# Maintainer:  Brad Pitcher <bradpitcher@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Larry Hajali <larryhaja[at]gmail[dot]com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=xvst
_pkgname=xVideoServiceThief
pkgver=2.5.2
pkgrel=1
pkgdesc='GUI tool for downloading videos from sites like YouTube, GoogleVideo etc.'
url='http://xviservicethief.sourceforge.net'
license=('GPL3')
arch=('i686' 'x86_64' 'aarch64')
depends=('ffmpeg' 'qt5-webkit' 'qt5-script')
makedepends=('sed' 'qt5-tools')
optdepends=('flvstreamer: for downloading flv files.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xVST/xVideoServiceThief/archive/${pkgver}.tar.gz"
        'xvst.desktop'
        'disable_update.patch'
        'keezmovies.patch'
        'myvideo.patch'
        'sunporno.patch'
        'wat.tv.patch')
sha256sums=('f54e5492bc1bfc7c2b1b24242de77e0821d85a1bb263d77c4b646789ab570b6e'
            '0a1344c9bd969c2fd608e071426c562386691e8815a13097c0f71c3b82876b18'
            'cea0379535ae99f19a1d8b3f1abfdd8a6f9ff4ee9dd2853061c6f42ba0fcde1c'
            'ae4af13b96095f8a0d491bab6865c2f75175b9f71762cba868b70aedc6890c73'
            'f5d395343cce45597c879e6836761aa481a51e07e7bc26c885ec9e0ac16f5272'
            'fc20e4f71f78fc4168843702ba6eaa584f12a2984c13e314bed719d4b20a740f'
            '32276bbba698c6de0e739550a0f03cc63545a5c2dc1fe5d39ac52874f069f8d3')

prepare() {
	cd ${_pkgname}-${pkgver}

  # Patches provided by getdeb.net. Add/fix download sites and turns off
  # automatic updates.
  for i in "${srcdir}"/*.patch; do
    patch -p1 < "${i}"
  done

  # Fix path names and end-of-line encoding.
  sed -i "s|getApplicationPath()\ +\ \"|\"/usr/share/${pkgname}|g" src/options.cpp
  sed -i 's/\r//' "how to compile.txt"
}

build() {
  cd ${_pkgname}-${pkgver}

  # Creat translation files.
  lrelease-qt5 resources/translations/*.ts
  rm -f resources/translations/template_for_new_translations.qm

  qmake-qt5 -set build_mode dynamic_build
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS+="${CFLAGS}" QMAKE_CXXFLAGS+="${CXXFLAGS}" CONFIG+=release -o Makefile xVideoServiceThief.pro
  make
}

package()
{
  cd ${_pkgname}-${pkgver}

  install -d -m 0755 "${pkgdir}/usr/share/${pkgname}/"{plugins,languages}
  find resources/services -name "*.js" -exec cp -dpR {} "${pkgdir}/usr/share/${pkgname}/plugins" \;
  install -m 0644 resources/translations/*.qm "${pkgdir}/usr/share/${pkgname}/languages"
  install -m 0644 resources/translations/definitions/*.language "${pkgdir}/usr/share/${pkgname}/languages"
  find "${pkgdir}/usr/share/${pkgname}/" -type f -exec chmod 0644 '{}' \;
  install -Dm755 bin/${pkgname} "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/xvst.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 resources/images/InformationLogo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 "GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/GPL.txt"

  install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a "how to compile.txt" README.md resources/{changelog.txt,service_list.html} \
    "${pkgdir}/usr/share/doc/${pkgname}"
}
