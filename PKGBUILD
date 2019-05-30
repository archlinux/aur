# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: bohoomil <bohoomil@zoho.com>
# Maintainer Solomon Choina <shlomochoina@gmail.com>
pkgname=fontconfig-infinality
_pkgname=fontconfig-ultimate
_basename=fontconfig
pkgdesc="A library for configuring and customizing font access, optimized for freetype2-infinality."
date=20190528
url='http://www.fontconfig.org/release/'
license=('custom' 'MIT')
pkgver=2.13.1+12+g5f5ec56
pkgrel=1
arch=('i686' 'x86_64')
depends=('expat' 'freetype2')
makedepends=('gperf' 'python-lxml' 'python-six' 'git')
options=('libtool')
provides=('fontconfig=$pkgver' 'fontconfig-infinality' 'fontconfig-infinality-ultimate')
conflicts=('fontconfig' 'fontconfig-infinality' 'fontconfig-infinality-git' 'fontconfig-infinality-ultimate-git')
replaces=('fontconfig-iu-comp')
backup=('etc/fonts/fonts.conf'
        'etc/fonts/conf.avail.infinality/combi/30-metric-aliases-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/37-repl-global-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/60-latin-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/65-non-latin-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/66-aliases-wine-combi.conf'
        'etc/fonts/conf.avail.infinality/35-repl-custom.conf'
        'etc/fonts/conf.avail.infinality/38-repl-webfonts-custom.conf'
        'etc/fonts/conf.avail.infinality/97-selective-rendering-custom.conf')
install=fontconfig-ultimate.install
_commit=5f5ec5676c61b9773026a9335c9b0dfa73a73353 # master
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git#commit=$_commit"
        https://raw.githubusercontent.com/archfan/infinality_bundle/master/02_fontconfig-iu/fontconfig-infinality-conf.tar.bz2
#}

        fc-cache-ib.hook
        0001-configure-${date}.patch
        0002-configure-${date}.ac.patch
        0003-Makefile-${date}.in.patch
        0004-Makefile-${date}.conf.d.patch
        0005-Makefile-${date}.am.patch
        )

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {

  patches=(0001-configure-${date}.patch
           0002-configure-${date}.ac.patch
           0003-Makefile-${date}.in.patch
           0004-Makefile-${date}.conf.d.patch
           0005-Makefile-${date}.am.patch
   )

  # copy fontconfig-ib patches & stuff
   [ -d "${pkgname}" ] || ln -sf fontconfig "${pkgname}"
  cp -r fontconfig-infinality-conf/conf.d.infinality "${_basename}/conf.d.infinality"
  cd "${_basename}"
  NOCONFIGURE=1 ./autogen.sh

  # infinality & post release fixes
  for patch in "${patches[@]}"; do
    patch -Np1 -i ../${patch}
  done

  aclocal
  libtoolize -f
  automake -afi

}

build() {
  cd "${_basename}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-templateinfdir=/etc/fonts/conf.avail.infinality \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/local/share/fonts
  make
}

#check() {
#  cd "${_basename}"
#  make -k check
_install_conf() {
  echo "about to _install_conf($1)..."
  install -m644 "$1" "$pkgdir/etc/fonts/conf.avail"
  ln -s "../conf.avail/${1##*/}" "$pkgdir/etc/fonts/conf.d"
  # copy presets
  cp -r "${srcdir}"/fontconfig-infinality-conf/conf.avail.infinality/{combi,free,ms,fonts-settings} \
    "${pkgdir}"/etc/fonts/conf.avail.infinality
}

package() {
  cd "${_basename}"
  make DESTDIR="${pkgdir}" install

  #Install license
  install -m755 -d "${pkgdir}"/usr/share/licenses/"${_basename}"
  install -m644 COPYING "${pkgdir}"/usr/share/licenses/"${_basename}"

  # alpm hook
  install -D -m 644 "${srcdir}"/fc-cache-ib.hook \
    "${pkgdir}/usr/share/libalpm/hooks/90-fc-cache-ib.hook"

  ## copy presets
  mkdir -p "${pkgdir}"/etc/fonts/conf.avail.infinality
  cp -r "${srcdir}"/fontconfig-infinality-conf/conf.avail.infinality/* \
    "${pkgdir}"/etc/fonts/conf.avail.infinality

  # install fc-presets
  install -m755 ${srcdir}/fontconfig-infinality-conf/"fc-presets" "${pkgdir}"/usr/bin/"fc-presets"

  # copy documentation
  install -m755 -d "${pkgdir}"/usr/share/doc/"${pkgname}"
  cp -r doc "${pkgdir}"/usr/share/

}
sha256sums=('SKIP'
            '092e1d5afb0118136544677cced0a10d6b759e74b38db1483bd3023d9be853d4'
            '026971a9fac1ee4fb0ef74d5833ce5e12b4645de8ebdf1cadb3cb943cf46abd3'
            '6cbe70a851e6046addc978d475c10b0cf77ee5074dbe4cbed2b66c6d1dce38e4'
            'a587293db608c8a5998b1257e34ebe4b116232cb6b24cfa87d5c42ded9543294'
            '7ec9377bb7e4df4db23dd1a5aef4e804864ff22c0be290477aadc6000bbca7c9'
            '84c6844b64b72c47f57bd75e355d64f857b84d7db2d2980ca022c494e0122641'
            'c934695b792172021be09d2a72c08651bed511bcadba6e62f8af871e630a3bdf')
