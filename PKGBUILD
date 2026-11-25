# Maintainer: nyrda <nyrda@keymasq.tools>

# The hyprmasq plugin of a release, prebuilt for the Hyprland builds that Arch and Omarchy's stable channel ship, so that
# nothing is compiled on your machine and a Hyprland update needs no rebuild. A plugin must match the Hyprland build
# that loads it, so the release has one plugin for each Hyprland release that hyprmasq targets, each built on the
# oldest userland that runs it. hyprland-builds names the Hyprland builds that each one runs: CI added a build there
# once the plugin compiled against its headers to the same binary, it exports what the plugin uses, and its hooked
# sources did not change, see packaging/aur/builds.py of the repository. The plugin refuses any other build, and
# hyprmasq_plugin.lua loads the plugin for the running Hyprland's version.
# The CI of github.com/nyrda/hyprmasq publishes this file from packaging/aur. It sets pkgver to the release, _plugins,
# hyprland-builds, sha256sums and pkgrel. A Hyprland build that it verifies later bumps pkgrel.

pkgname=hyprmasq-plugin-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Hyprland plugin of hyprmasq: per-window screenshots and input, prebuilt for the Hyprland of Arch and Omarchy'
arch=(x86_64)
url='https://github.com/nyrda/hyprmasq'
license=(MIT)
depends=(glibc hyprland libei libgcc libglvnd libpng libstdc++ libxcb libxkbcommon)
provides=("hyprmasq-plugin=$pkgver")
# A build of hyprmasq from a clone installs the plugin and the loader too: from 0.3.0 on it provides hyprmasq-plugin,
# and before that it did not, so pacman offers to remove it rather than stopping at the loader that both have.
conflicts=(hyprmasq-plugin 'hyprmasq<0.3.0')
options=(!debug !strip)
# The Hyprland version of the build that each plugin was compiled against.
_plugins=(0.56.2 0.57.2)
source=(hyprland-builds hyprmasq_plugin.lua "LICENSE-$pkgver::https://raw.githubusercontent.com/nyrda/hyprmasq/v$pkgver/LICENSE")
for _plugin in "${_plugins[@]}"; do
  source+=("hyprmasq-$pkgver-hyprland-$_plugin.so::$url/releases/download/v$pkgver/hyprmasq-$pkgver-hyprland-$_plugin.so")
done
sha256sums=('30e9dba854e5a19d736f1bdc0ab36ae68941fccf3d2456ef7b35f1e86a8e349c'
            'dd7b29118e7671e24e3adc50f50fd186e0b3df971d96a35072bde52d6f012547'
            '0b338958047a8d42649c764ea82411c99c366b5d935c90f2465732afef950156'
            '6e50d713f9e46a3eaf3243cd29c59645ef6aead69d652a2d2b32c44987399930'
            'e35326a552647e6322a8466d73eb9f987949ff32d5cac59d4af1ea2d5cc5c8c4')

package() {
  local plugin abi label version how
  for plugin in "${_plugins[@]}"; do
    install -Dm755 "hyprmasq-$pkgver-hyprland-$plugin.so" "$pkgdir/usr/lib/hyprmasq/$plugin/hyprmasq.so"
    awk -v plugin="$plugin" '$1 !~ /^#/ && $2 == plugin' hyprland-builds | install -Dm644 /dev/stdin "$pkgdir/usr/lib/hyprmasq/$plugin/hyprland-builds"
  done
  # The loader reads hl.version(): a link from each Hyprland version that a plugin runs to that plugin.
  while read -r abi label version how; do
    if [[ $abi != \#* && ! -e $pkgdir/usr/lib/hyprmasq/${version%-*} ]]; then
      ln -s "$label" "$pkgdir/usr/lib/hyprmasq/${version%-*}"
    fi
  done < hyprland-builds
  install -Dm644 hyprmasq_plugin.lua -t "$pkgdir/etc/xdg/hypr"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
