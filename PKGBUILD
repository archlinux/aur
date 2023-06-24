# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=fontconfig-git
pkgver=2.14.1+r40+g842f09c
pkgrel=1
pkgdesc="Library for configuring and customizing font access (from git)"
url=https://www.freedesktop.org/wiki/Software/fontconfig/
arch=(x86_64)
license=(custom)
depends=(
  expat
  freetype2
)
makedepends=(
  docbook-sgml
  docbook-utils
  git
  gperf
  meson
  perl-sgmls
)
provides=(
  fontconfig
  fontconfig-docs
)
conflicts=(
  fontconfig
  fontconfig-docs
)
replaces=('fontconfig-docs<2:2.13.93-1')
backup=(etc/fonts/fonts.conf)
install=fontconfig.install
source=(
  "git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git"
  40-fontconfig-config.script
  40-fontconfig-config.hook
  fontconfig.hook
)
b2sums=('SKIP'
        '7fb63e76ab126bc0a7decfd74c53429ad1ce6d13de2f14037259616d8d4150b8fa4601c7f02b75918ccd5995d424816dc9d01a5fe7e39dc3dd1fcc83dfdb0fe8'
        'b06b3f2b8c0c38139a9247c26a641e6dc01d50b530478dd14133175a603f60b0af901af16c9fcf1ce73d23786ea14bfdbacd39f1dcfd88f6382965ad22be1411'
        'dfbf47c069c88da7687511356cef5bb94b7190e558a6f08390d6976fa7065ba7137ccb0a5ca1defdef655091afe74eb8a3d33fb9f3e0633409aa79f753ad276d')

prepare() {
  cd fontconfig
}

pkgver() {
  cd fontconfig
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  local meson_options=(
    -D default-hinting=slight
    -D default-sub-pixel-rendering=rgb
    -D doc-html=enabled
    -D doc-pdf=disabled
    -D doc-txt=disabled
  )
  arch-meson fontconfig build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libexpat.so
    libfreetype.so
  )
  provides+=(libfontconfig.so)

  meson install -C build --destdir "$pkgdir"

  # Handle conf.d using the hook to avoid overwriting the symlinks on upgrade
  mkdir -p "$pkgdir/usr/share/fontconfig/conf.default"
  for _f in "$pkgdir"/etc/fonts/conf.d/*.conf; do
    ln -sr "$pkgdir"/usr/share/fontconfig/conf.{avail,default}/"${_f##*/}"
    rm "$_f"
  done

  install -Dm644 *.hook -t "$pkgdir/usr/share/libalpm/hooks"
  install -D 40-fontconfig-config.script \
    "$pkgdir/usr/share/libalpm/scripts/40-fontconfig-config"
  install -Dm644 fontconfig/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
