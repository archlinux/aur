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
pkgver=0.1.0
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
sha256sums_x86_64=('a4f7c25ae7ef93bb6d004d67af7d48337a4a681a17b9999a601358050dd2e1bb')
sha256sums_aarch64=('0b3737f4f6f00c1573310b4c375e9135f0c1a891c25f4606095cfabc98404734')

package() {
    # The archive is a DESTDIR image, so it already carries the usr/ prefix and
    # the layout pacman expects.
    cp -a "$srcdir/usr" "$pkgdir/"
}
