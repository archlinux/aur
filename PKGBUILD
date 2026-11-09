# Maintainer: Atomic Chat <support@atomic.chat>
#
# Generated from packaging/PKGBUILD.in in https://github.com/AtomicBot-ai/atomic-agent by the
# release workflow (scripts/linux-packages.ts pkgbuild); change the template there, not this copy.

pkgname=atomic-agent-bin
pkgver=0.7.0
_version=0.7.0
pkgrel=1
pkgdesc='Local-first AI agent for the terminal: browses, edits files, runs approved commands, remembers (https://atomicagent.io)'
arch=('x86_64' 'aarch64')
url='https://github.com/AtomicBot-ai/atomic-agent'
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=('git: git tools'
            'wmctrl: window control on X11'
            'xclip: clipboard on X11'
            'wl-clipboard: clipboard on Wayland'
            'libnotify: desktop notifications')
provides=('atomic-agent')
conflicts=('atomic-agent')
# A Node SEA binary carries its program in a section of the executable, and the bundle ships
# prebuilt native addons; stripping either breaks them.
options=('!strip' '!debug')

# The release archive of each architecture: the SEA binary and the directories the runtime resolves
# next to it. The asset names carry no version, so the local name does (makepkg caches by it).
_base='https://github.com/AtomicBot-ai/atomic-agent/releases/download/v0.7.0'
source_x86_64=("atomic-agent-${_version}-linux-x64.tar.gz::${_base}/atomic-agent-linux-x64.tar.gz")
source_aarch64=("atomic-agent-${_version}-linux-arm64.tar.gz::${_base}/atomic-agent-linux-arm64.tar.gz")
sha256sums_x86_64=('1b908d4c726e719df33c1b0c0fd538b2eddf2e6c8c144fed3d95f4665e10ba4e')
sha256sums_aarch64=('475c1b4234e7ebf3ba43b4db6c3312153e8d9867ecedb3c589331fc252aa82ab')

package() {
  local slug
  case "${CARCH}" in
    x86_64) slug='linux-x64' ;;
    aarch64) slug='linux-arm64' ;;
  esac

  # The whole tree under /usr/lib/atomic-agent, as the deb and rpm lay it out; /usr/bin holds
  # symlinks, which Node resolves through /proc/self/exe so the runtime finds its assets.
  install -dm755 "${pkgdir}/usr/lib/atomic-agent" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/${slug}/." "${pkgdir}/usr/lib/atomic-agent/"
  chmod 755 "${pkgdir}/usr/lib/atomic-agent/atomic-agent"
  ln -s ../lib/atomic-agent/atomic-agent "${pkgdir}/usr/bin/atomic-agent"
  ln -s ../lib/atomic-agent/atomic-agent "${pkgdir}/usr/bin/atag"

  # Tells `atomic-agent update` and `atomic-agent uninstall` that pacman owns the tree.
  printf 'aur\n' >"${pkgdir}/usr/lib/atomic-agent/install-source"

  install -Dm644 "${pkgdir}/usr/lib/atomic-agent/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
