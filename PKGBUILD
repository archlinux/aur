# Maintainer: Yatao Li <yatao.li@live.com>
#
# Canonical AUR recipe for dingtalk-wayland-screenshare-git.
# IMPORTANT: after editing this file (or after pushing new upstream commits),
# ALWAYS regenerate .SRCINFO so the advertised pkgver matches pkgver():
#
#     makepkg --printsrcinfo > .SRCINFO
#     git add PKGBUILD .SRCINFO && git commit && git push
#
# The perpetual "yay -Syu wants to reinstall this every time" bug was caused by
# .SRCINFO advertising a static pkgver=0.1.0 while pkgver() builds r<count>.<hash>.
# Because a numeric-leading version sorts NEWER than an alphabetic-leading one,
# yay saw 0.1.0-1 as a permanent upgrade over the installed r2.b44c9ac-1.
pkgname=dingtalk-wayland-screenshare-git
pkgver=r4.37b3e58
pkgrel=1
pkgdesc="Wayland screen sharing hook for Dingtalk (via xdg-desktop-portal + pipewire)"
arch=('x86_64')
url="https://github.com/yatli/dingtalk-wayland-screencast"
license=('MIT')
depends=(
  'dingtalk-bin'
  'libportal'
  'pipewire'
  'wireplumber'
  'xdg-desktop-portal'
  'libxrandr'
  'libxcomposite'
)
makedepends=(
  'cmake'
  'ninja'
  'pkgconf'
  'git'
)
provides=("dingtalk-wayland-screenshare=${pkgver}")
conflicts=('dingtalk-wayland-screenshare')
source=('dingtalk-wayland-screencast::git+https://github.com/yatli/dingtalk-wayland-screencast.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dingtalk-wayland-screencast"
  # r<commit-count>.<short-hash>; monotonic and matches the currently
  # installed version scheme (r2.b44c9ac). Keep this scheme so upgrades sort
  # correctly (r2 -> r3 -> ...). Do NOT reintroduce a plain 0.x.y here.
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -S "$srcdir/dingtalk-wayland-screencast/src" \
    -B "$srcdir/build" \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build"
}

package() {
  # Install the hook library
  install -Dm755 "$srcdir/build/libdingtalk_hook.so" \
    "$pkgdir/usr/lib/dingtalk/libdingtalk_hook.so"

  # Install the launcher script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/dingtalk-wayland-screenshare" <<'LAUNCHER'
#!/bin/bash -e
# Launch Dingtalk with Wayland screen share hook
export QT_QPA_PLATFORM="wayland;xcb"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export LD_PRELOAD="/usr/lib/dingtalk/libdingtalk_hook.so${LD_PRELOAD:+:$LD_PRELOAD}"
cd /opt/dingtalk/release
exec ./com.alibabainc.dingtalk "$@"
LAUNCHER

  # Install desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/dingtalk-wayland-screenshare.desktop" <<'DESKTOP'
[Desktop Entry]
Categories=Chat;Network;
Comment=DingTalk with Wayland Screen Share
Exec=dingtalk-wayland-screenshare %u
GenericName=dingtalk
Icon=dingtalk
Keywords=dingtalk;
MimeType=x-scheme-handler/dingtalk;
Name=DingTalk (Wayland Screen Share)
Name[zh_CN]=钉钉 (Wayland 屏幕共享)
Type=Application
DESKTOP

  # Install license
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'LICENSE'
MIT License

Copyright (c) 2026 Yatao Li

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
LICENSE
}
