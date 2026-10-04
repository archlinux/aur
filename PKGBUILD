# Maintainer: Sykik <xo.sykik@gmail.com>
pkgname=inno
pkgver=0.8.0
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
# pipewire-pulse supplies paplay and the sound server itself; without it
# every sound path is dead on a bare system.
depends=('wayland' 'cairo' 'dbus' 'glibc' 'pipewire-pulse')
# No version constraint on purpose. rustup provides `rust` and `cargo`
# unversioned, so `rust>=1.85` cannot be satisfied by it and pacman reaches for
# Arch's rust package, which conflicts with the installed rustup and prompts to
# remove it. That is a confusing way to learn that a build dependency was
# spelled too precisely. Requiring the names is enough: cargo itself refuses an
# edition its rustc cannot handle, and says so.
makedepends=('rust' 'cargo')
# A VCS source pinned to the tag, not the release tarball.
#
# GitHub generates archive tarballs on the fly and the bytes are not
# reproducible: the same tag can hash differently depending on which edge serves
# it. Pinning a sha256 on one therefore fails the build on AUR's servers while
# looking correct everywhere else, which is exactly what happened here. git
# already verifies the commit hash, so the tag is the integrity check, and the
# build becomes reproducible.
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
b2sums=('SKIP')

build() {
  cd "${pkgname}"
  cargo build --release
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/inno "${pkgdir}/usr/bin/inno"
  install -Dm644 inno.toml "${pkgdir}/etc/xdg/inno/inno.toml"
  for f in events/*.toml; do
    install -Dm644 "$f" "${pkgdir}/etc/xdg/inno/${f}"
  done
  install -Dm644 inno.service "${pkgdir}/usr/lib/systemd/user/inno.service"
  for f in assets/sounds/*.wav; do
    [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/etc/xdg/inno/${f}"
  done
  # Frame animations referenced by the shipped config. Without these
  # --check-config fails on a packaged install.
  for d in assets/animations/*/; do
    [ -d "$d" ] || continue
    for f in "$d"*.png; do
      [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/etc/xdg/inno/${f}"
    done
  done
}

# Copy the shipped defaults into the user's own config directory.
#
# This is the opposite of the usual Arch rule, which is to never touch
# ~/.config on install because it holds local edits. inno overrides it on
# purpose: the config and the assets it points at ship together, so a user whose
# config directory holds a config copied months ago is running against frame
# directories and sounds that may have been renamed or removed since. A config
# referencing an animation that is not there renders as a plain text card and
# says nothing about why.
#
# The two package-owned trees are replaced rather than merged, so a renamed or
# deleted frame cannot survive as a stale leftover. Anything the user added
# outside those two trees is untouched.
install_user_config() {
  # post_install runs as root, and sudo strips XDG_CONFIG_HOME. HOME usually
  # survives, but not on every sudoers setup, and writing the config to
  # /root/.config would look like it worked while leaving the user with nothing.
  local base=${XDG_CONFIG_HOME:-}
  if [ -z "$base" ]; then
    if [ -n "${SUDO_USER:-}" ]; then
      base=$(getent passwd "$SUDO_USER" | cut -d: -f6)/.config
    else
      base=$HOME/.config
    fi
  fi
  local dest=$base/inno
  mkdir -p "$dest"
  install -Dm644 /etc/xdg/inno/inno.toml "$dest/inno.toml"
  rm -rf "$dest/events" "$dest/assets"
  cp -a /etc/xdg/inno/events "$dest/events"
  mkdir -p "$dest/assets"
  cp -a /etc/xdg/inno/assets/animations "$dest/assets/animations"
  cp -a /etc/xdg/inno/assets/sounds "$dest/assets/sounds"
  echo "$dest"
}

announce() {
  local dest=$1
  msg "=============================================================="
  msg "  inno is installed, and your config is ready to edit:"
  msg ""
  msg "      $dest/inno.toml"
  msg ""
  msg "  READ THE DOCS AND MAKE IT YOURS:"
  msg "      https://github.com/SykikXO/inno#readme"
  msg ""
  msg "  The defaults are a starting point, not a recommendation. The"
  msg "  things worth changing first:"
  msg "      position      where it appears, and the margins"
  msg "      format        the text template, including {percent}%"
  msg "      scale         size on a hidpi output"
  msg "      sound = false to silence it entirely"
  msg "      signals       which battery levels notify, and what they say"
  msg ""
  msg "  Edit the file, then apply it without restarting:"
  msg "      busctl --user call org.inno.Control /org/inno/Control \\"
  msg "          org.inno.Control Reload"
  msg ""
  msg "  Check a config before applying it:"
  msg "      inno --check-config"
  msg "=============================================================="
}

post_install() {
  announce "$(install_user_config)"
}

post_upgrade() {
  announce "$(install_user_config)"
}
