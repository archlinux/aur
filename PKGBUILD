# Maintainer: Joop Kiefte <ikojba at gmail dot com>
# Based on Arch's fontconfig PKGBUILD (2:2.18.4-1):
#   Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#   Contributor: Jan de Groot <jgc@archlinux.org>
#
# fontconfig from the "typical" branch: per-language CJK aliases, CSS-ordered
# weight/width matching, family-first matching, OpenType meta/PANOSE/locl
# scanning, design-language ranking, and fc-match --explain.

pkgname=fontconfig-typical-git
_basever=2.18.4  # upstream main after 2.18.4 ...
_basecommit=3e9035e5  # ... at this commit; pkgver counts the typical commits on top
pkgver=2.18.4.r28.gd5020de
pkgrel=1
pkgdesc="fontconfig with matching by the fonts' own OpenType data: per-language CJK, CSS-ordered weight/width, family first, design languages, fc-match --explain (git)"
url=https://github.com/LaPingvino/typical
arch=(x86_64)
license=('HPND AND Unicode-DFS-2016')
depends=(
  bash
  expat
  freetype2
  glibc
)
makedepends=(
  docbook-sgml
  docbook-utils
  git
  gperf
  meson
  perl-sgmls
)
provides=("fontconfig=2:$pkgver" "fontconfig-typical=$pkgver")
conflicts=(fontconfig fontconfig-docs fontconfig-typical)
backup=(etc/fonts/fonts.conf)
install=fontconfig.install
# The typical branch on GitHub.
source=(
  "typical::git+https://github.com/LaPingvino/typical.git#branch=typical"
  40-fontconfig-config.hook
  40-fontconfig-config.script
  fontconfig.hook
)
b2sums=('SKIP'
        'b06b3f2b8c0c38139a9247c26a641e6dc01d50b530478dd14133175a603f60b0af901af16c9fcf1ce73d23786ea14bfdbacd39f1dcfd88f6382965ad22be1411'
        '7fb63e76ab126bc0a7decfd74c53429ad1ce6d13de2f14037259616d8d4150b8fa4601c7f02b75918ccd5995d424816dc9d01a5fe7e39dc3dd1fcc83dfdb0fe8'
        'dfbf47c069c88da7687511356cef5bb94b7190e558a6f08390d6976fa7065ba7137ccb0a5ca1defdef655091afe74eb8a3d33fb9f3e0633409aa79f753ad276d')

pkgver() {
  cd typical
  printf "%s.r%s.g%s" "$_basever" \
    "$(git rev-list --count $_basecommit..HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local meson_options=(
    -D bitmap-conf=noinstall
    -D default-sub-pixel-rendering=noinstall
    -D doc-html=enabled
    -D doc-pdf=disabled
    -D doc-txt=disabled
  )

  # TYPICAL_NODOCS=1 builds without the docbook toolchain: no man pages and
  # no HTML docs (and the package then does not provide fontconfig-docs).
  if [[ -n $TYPICAL_NODOCS ]]; then
    meson_options+=(-D doc=disabled)
  fi

  arch-meson typical build "${meson_options[@]}"
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
  if [[ -z $TYPICAL_NODOCS ]]; then
    provides+=(fontconfig-docs)
  fi

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
  install -Dm644 typical/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
