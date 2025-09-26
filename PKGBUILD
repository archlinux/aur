# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=electron-blur-me-not

# Some pkgnames are commented out; this means that no `blur-me-not`
# package is required for those. Instead, create a flags file in
# `~/.config` (or in `XDG_CONFIG_HOME`), and add the necessary flags
# to that file. The name of the flags file varies per package.
# Using a flags file is much simpler than a `blur-me-not` package.
pkgname=(
  '1password-blur-me-not'
  # 'code' -- create a `code-flags.conf` file instead
  # 'discord' -- create a `discord-flags.conf` file instead
  'electron-fiddle-blur-me-not'
  'element-desktop-blur-me-not'
  'rambox-pro-bin-blur-me-not'
  'signal-desktop-blur-me-not'
  # 'spotify' -- create a `spotify-flags.conf` file instead
)

pkgver=0.1.7
pkgrel=1
pkgdesc='Auto-enable Wayland (ozone) for apps that come with a vendored Electron'
arch=('any')
url='https://aur.archlinux.org/pkgbase/electron-blur-me-not'
license=('Apache-2.0')
options=('!strip')

source=(
  "${pkgbase}.hook"
  "${pkgbase}-patch.sh"
  "${pkgbase}-unpatch.sh"
  'electron-flags.conf'
  'electron-launcher.sh'
)

sha512sums=(
  '5057477e2155a61a110a106e66376137f19472df215383435885529f6d8fbdc533ad912cb6a964cc2c8112d93f2443540729c3877b2259268729040c860f4506'
  '60698c4eefcec6d8171f7d9ca215dc9f66e73433d1e2f4703ae84ac3f5756e2121049242460eda85cff0706feb2e2cfa07d194bc8d1f217f9b1f5caed0f70320'
  '80c7c25837725fdc882e502427367af970d264fa9adf1e18ab65040731f860a630f225bb761923814c640f70adcdac381b8e85c964d07a21de36e3b31a73321f'
  '244afae34952cc7d2d3d49ed1dd5a004eaf3c804be76b1ffb651ad31a3512acc5677aece4ede712c7e9fd3d59c081d3016831cac76f0fd234c5c50490ce760d7'
  'f50c26fb10442e2a4aee0ac8d413c0cef6d0918b481c862bd35f14d060284f22554fe617f717355c3bd0bd7ba71882cc935b83f4a121199e0145db747ffbd8fa'
)

_pkgdesc() {
  printf 'Auto-enable Wayland (ozone) for %s' "${pkgname%-blur-me-not}"
}

# shellcheck disable=SC2128 # during execution, pkgname is a string
_package() {
  local _executable
  _executable="${1?}"
  install="${pkgname}.install"

  mkdir -p \
    "${pkgdir}/usr/share/${pkgname}" \
    "${pkgdir}/usr/share/libalpm/hooks" \
    "${pkgdir}/usr/share/libalpm/scripts"

  install -D -m 644 -T \
    "${srcdir}/electron-flags.conf" \
    "${pkgdir}/etc/${pkgname%-blur-me-not}-flags.conf"

  sed \
    -e "s/{{basename}}/${pkgname%-blur-me-not}/g" \
    -e "s#{{executable}}#${_executable}#g" \
    "${srcdir}/electron-launcher.sh" \
    > "${pkgdir}/usr/share/${pkgname}/${_executable##*/}-launcher.sh"
  sed \
    -e "s#{{launcher}}#/usr/share/${pkgname}/${_executable##*/}-launcher.sh#g" \
    -e "s#{{backup}}#${_executable}#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "${srcdir}/${pkgbase}-patch.sh" \
    > "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"
  sed \
    -e "s#{{executable}}#${_executable}#g" \
    -e "s#{{pkgname}}#${pkgname}#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "${srcdir}/${pkgbase}-unpatch.sh" \
    > "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-unpatch"

  chmod 755 "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"
  chmod 755 "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-unpatch"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/${_executable##*/}-launcher.sh"

  sed \
    -e "s/{{basename}}/${pkgname%-blur-me-not}/g" \
    "${srcdir}/${pkgbase}.hook" \
    > "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}

package_1password-blur-me-not() {
  depends=('bash' "${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc '1Password')"
  _package '/opt/1Password/1password'
}

# shellcheck disable=SC2128 # during execution, pkgname is a string
package_electron-fiddle-blur-me-not() {
  depends=('bash' "${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Electron Fiddle')"
  # Original package has no symlink, so make a backup at patch time
  _package "/usr/lib/${pkgname}/original/electron-fiddle"
}

# shellcheck disable=SC2128 # during execution, pkgname is a string
package_element-desktop-blur-me-not() {
  depends=('bash' "${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Element Desktop')"
  # Original package has no symlink, so make a backup at patch time
  _package "/usr/lib/${pkgname}/original/element-desktop"
}

package_rambox-pro-bin-blur-me-not() {
  depends=('bash' "${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Rambox Pro')"
  _package '/opt/rambox/rambox'
}

package_signal-desktop-blur-me-not() {
  depends=('bash' "${pkgname%-blur-me-not}")
  pkgdesc="$(_pkgdesc 'Signal Desktop')"
  _package '/usr/lib/signal-desktop/signal-desktop'
}
