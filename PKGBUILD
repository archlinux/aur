# Maintainer: xander-lin

# Prebuilt package: installs the release artifact published on GitHub instead of
# compiling. The -git package stays available for people who want to build from
# source or run a commit that has no release artifact yet.
#
# The artifact is a tar.zst of the install tree (a `meson install` DESTDIR
# image), not a bare .so: the addon also needs its fcitx5 addon descriptor and
# the udev rule, and shipping the tree that was actually tested keeps the
# package honest about what was verified.
pkgname=fcitx5-ainput-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Voice input addon for fcitx5: push-to-talk ASR via CapsLock (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/ainput"
license=('MIT')
# No cargo/meson/git: nothing is compiled here. The Rust core is linked
# statically into ainput.so, so the remaining dependencies are exactly the
# system libraries the binary links against.
depends=('fcitx5' 'libebur128' 'libpulse' 'curl' 'speexdsp' 'libsoxr')
install=PKGBUILD.install
# Both packages install the same files, so only one may be present. This is the
# mechanism that makes an install actually offer to remove the other; a
# `replaces` entry would be ignored by `pacman -U`, which is how paru installs
# AUR packages.
conflicts=('fcitx5-ainput-git')
provides=('fcitx5-ainput')
# Per-architecture sources: pacman only requires the checksum for the arch it is
# building on, so an aarch64 user never needs the x86_64 artifact.
source_x86_64=("fcitx5-ainput-$pkgver-x86_64.tar.zst::$url/releases/download/$pkgver/fcitx5-ainput-$pkgver-x86_64.tar.zst")
source_aarch64=("fcitx5-ainput-$pkgver-aarch64.tar.zst::$url/releases/download/$pkgver/fcitx5-ainput-$pkgver-aarch64.tar.zst")
sha256sums_x86_64=('83fd962ef7acb1b2a83349d04cf21bb0d994dd42c4039824db97de4c9c9a87fa')
sha256sums_aarch64=('f2d2ce401998ac415e009a372687ef521a84a915409b34d2a28318abafa9576c')

package() {
    # The archive is a DESTDIR image, so it already carries the usr/ prefix and
    # the layout pacman expects.
    cp -a "$srcdir/usr" "$pkgdir/"
}
