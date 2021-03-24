# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=(fontconfig-minimal-git)
pkgver=2.13.91+48+gfcb0420
pkgrel=1
pkgdesc="Library for configuring and customizing font access"
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
arch=(x86_64)
license=(custom)
makedepends=(git meson gperf expat freetype2)
optdepends=('docbook-utils: docs'
            'docbook-sgml: docs'
            'perl-sgmls: docs')
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git"
        40-fontconfig-config.script
        40-fontconfig-config.hook
        fontconfig.hook)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgver() {
  cd fontconfig
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd fontconfig

}

build() {
  arch-meson fontconfig build \
    -D doc=disabled \
    -D doc-txt=disabled \
    -D doc-man=disabled \
    -D doc-pdf=disabled \
    -D doc-html=disabled \
    -D tests=disabled
  ninja $NINJAFLAGS -C build
}

#check() {
#  cd fontconfig
#  meson test -C build --print-errorlogs
#}

package_fontconfig-minimal-git() {
  depends=(expat libfreetype.so)
  provides=(libfontconfig.so fontconfig fontconfig-docs)
  conflicts=(fontconfig fontconfig-docs)
  replaces=('fontconfig-docs<2:2.13.93-1')
  install=fontconfig.install
  backup=(etc/fonts/fonts.conf)

  DESTDIR="$pkgdir" meson install -C build

# Handle conf.d using the hook to avoid overwriting the symlinks on upgrade
  mkdir -p "$pkgdir/usr/share/fontconfig/conf.default"
  for _f in "$pkgdir"/etc/fonts/conf.d/*.conf; do
    ln -sr "$pkgdir"/usr/share/fontconfig/conf.{avail,default}/"${_f##*/}"
    rm "$_f"
  done

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -D 40-fontconfig-config.script \
  "$pkgdir/usr/share/libalpm/scripts/40-fontconfig-config"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 fontconfig/COPYING
}

# vim:set sw=2 et:
