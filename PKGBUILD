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
pkgver=0.3.0
pkgrel=1
pkgdesc='Hyprland plugin of hyprmasq: per-window screenshots and input, prebuilt for the Hyprland of Arch and Omarchy'
arch=(x86_64)
url='https://github.com/nyrda/hyprmasq'
license=(MIT)
depends=(glibc hyprland libei libgcc libglvnd libpng libstdc++ libxcb libxkbcommon)
provides=("hyprmasq-plugin=$pkgver")
conflicts=(hyprmasq-plugin)
options=(!debug !strip)
# The Hyprland version of the build that each plugin was compiled against.
_plugins=(0.56.2 0.57.2)
source=(hyprland-builds hyprmasq_plugin.lua "LICENSE-$pkgver::https://raw.githubusercontent.com/nyrda/hyprmasq/v$pkgver/LICENSE")
for _plugin in "${_plugins[@]}"; do
  source+=("hyprmasq-$pkgver-hyprland-$_plugin.so::$url/releases/download/v$pkgver/hyprmasq-$pkgver-hyprland-$_plugin.so")
done
sha256sums=('7043d16d50140d7429c7377cba81a72aa00aff055afe201adf73cf32b1021892'
            'dd7b29118e7671e24e3adc50f50fd186e0b3df971d96a35072bde52d6f012547'
            '0b338958047a8d42649c764ea82411c99c366b5d935c90f2465732afef950156'
            '69bf4a8c4dca53cedec5a043fa59f1e66a6686bbb822e23618894a338781bb47'
            '865e06c73e35d479720498a483e30dae43a51f24dea8dee47d968a387068ffe0')

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
