# Maintainer: yogh-io <info@yogh.nl>
#
# picom with the picom-motion work: the branch winanim of a picom fork, which stages changes
# offered to picom one at a time, and the two plugins that use them: ws-direction (workspace
# transitions, any EWMH window manager) and win-cause (window animations, i3 only). The fork
# is not meant to last. Once a picom release has what the plugins need, this package goes,
# and the plugins get packages of their own against stock picom.
#
# Problems with it go to https://github.com/JornC/picom-motion/issues, not to picom.
# Otherwise the recipe follows Arch's picom package, including its GLX black screen patch.

pkgname=picom-motion-git
# A placeholder: makepkg runs pkgver() against the clones and rewrites this line.
pkgver=13.r2999.g7cbdb17
pkgrel=1
pkgdesc='picom with workspace and window animations for i3, from a fork that stages changes offered to picom'
arch=(x86_64)
url='https://jornc.github.io/picom-motion/'
license=('MPL-2.0 AND MIT')
depends=(hicolor-icon-theme libconfig libdbus libepoxy libev libgl libxcb pcre2 pixman xcb-util-image xcb-util-renderutil)
makedepends=(asciidoctor git mesa meson ninja uthash)
# The plugins' tests that need no X server: ws-direction's frame checker and win-cause's
# tile and screen checkers.
checkdepends=(python python-numpy)
optdepends=('i3-wm: win-cause needs i3; ws-direction works with any EWMH window manager'
            'dbus: for controlling picom via D-Bus'
            'python: for running picom-convgen.py'
            'rtkit: for realtime scheduling priority'
            'xorg-xprop: for picom-trans'
            'xorg-xwininfo: for picom-trans')
provides=("picom=13")
conflicts=(picom)
backup=(etc/xdg/picom.conf)
install=$pkgname.install
source=('picom::git+https://github.com/JornC/picom.git#branch=winanim'
        'ws-direction::git+https://github.com/JornC/picom-ws-direction-plugin.git'
        'win-cause::git+https://github.com/JornC/picom-win-cause-plugin.git'
        'fix_black_screen_with_glx_backend.patch::https://github.com/yshui/picom/commit/676196359c15bb654696b05700330685db914710.patch')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '660a5b48b7b44c5b3462378fd839f6fd42aff661ec729b11ff3cdba7dd397f6fd2185bc809d0d451243d1b0d86e9ad30c568f8f6292dea0aaf096b25424c5648')

# picom's version, then the commits of all three repos counted together, so a change in any
# of them raises it, and picom's commit.
pkgver() {
  local version count=0 repo
  version=$(sed -n "s/^project('picom', 'c', version: '\([^']*\)'.*/\1/p" picom/meson.build)
  for repo in picom ws-direction win-cause; do
    count=$((count + $(git -C "$repo" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$version" "$count" "$(git -C picom rev-parse --short=7 HEAD)"
}

prepare() {
  patch -d picom -Np1 -i "$srcdir/fix_black_screen_with_glx_backend.patch"
}

build() {
  arch-meson --buildtype=release -D with_docs=true picom picom/build
  meson compile -C picom/build

  # Against this picom's API headers, not whatever picom the build machine has.
  make -C ws-direction PICOM_API_CFLAGS="-I$srcdir/picom/include"
  make -C win-cause PICOM_API_CFLAGS="-I$srcdir/picom/include"
}

check() {
  # picom's unit tests exist only in a build made for them, with asserts on; the package
  # ships the release build above.
  arch-meson --buildtype=release -D unittest=true -D b_ndebug=false picom picom/build-test
  meson compile -C picom/build-test
  picom/build-test/src/picom --unittest

  make -C ws-direction check PICOM_API_CFLAGS="-I$srcdir/picom/include"
  make -C win-cause check PICOM_API_CFLAGS="-I$srcdir/picom/include" WS_DIRECTION="$srcdir/ws-direction"
}

package() {
  meson install -C picom/build --destdir "$pkgdir"

  install -Dm644 picom/picom.sample.conf "$pkgdir/etc/xdg/picom.conf"
  install -Dm644 picom/picom.sample.conf "$pkgdir/usr/share/doc/picom/picom.conf.example"
  install -Dm644 picom/LICENSES/MIT "$pkgdir/usr/share/licenses/$pkgname/MIT"

  # picom finds a plugin by name in its lib directory, and a style in ~/.config/picom/include/
  # before /etc/xdg/picom/include/, so a copy there wins: copy a style to change it.
  make -C ws-direction install PICOM_API_CFLAGS="-I$srcdir/picom/include" \
    DESTDIR="$pkgdir" PREFIX=/usr PLUGINDIR=/usr/lib/picom/plugins \
    STYLEDIR=/etc/xdg/picom/include/ws-direction
  make -C win-cause install PICOM_API_CFLAGS="-I$srcdir/picom/include" \
    DESTDIR="$pkgdir" PREFIX=/usr PLUGINDIR=/usr/lib/picom/plugins \
    STYLEDIR=/etc/xdg/picom/include/win-cause
}
