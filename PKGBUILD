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

pkgver=0.1.8
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
  'd01e06863faa12fe8f33fb94317979e51a9f5415ea5de22b53dddb4c2d9c092814290773d977165c3e1762540f35b0e8931316a32db7cb921968dfb3aa6f7ca1'
  'ac18cb54b08005c4b866bffbdea5ec4ca9bf44952cda22ebf984a9656c46d6096364a91676cc407fc11be6b09244acd5befc25dd467c2ebaea096a8160c60f3c'
  '244afae34952cc7d2d3d49ed1dd5a004eaf3c804be76b1ffb651ad31a3512acc5677aece4ede712c7e9fd3d59c081d3016831cac76f0fd234c5c50490ce760d7'
  'f50c26fb10442e2a4aee0ac8d413c0cef6d0918b481c862bd35f14d060284f22554fe617f717355c3bd0bd7ba71882cc935b83f4a121199e0145db747ffbd8fa'
)

_pkgdesc() {
  printf 'Auto-enable Wayland (ozone) for %s' "${pkgname%-blur-me-not}"
}

# shellcheck disable=SC2128 # during execution, pkgname is a string
_package() {
  local _executable _desktop_file
  _executable="${1?}"
  _desktop_file="${2:-}"
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

  if [ -n "${_desktop_file}" ]; then
    set -- \
      -e 's#{{has_desktop_file_condition}}#/usr/bin/true#g' \
      -e "s#{{desktop_file}}#${_desktop_file}#g"
  else
    set -- \
      -e 's#{{has_desktop_file_condition}}#/usr/bin/false#g'
  fi

  sed \
    -e "s#{{launcher}}#/usr/share/${pkgname}/${_executable##*/}-launcher.sh#g" \
    -e "s#{{backup}}#${_executable}#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "$@" \
    "${srcdir}/${pkgbase}-patch.sh" \
    > "${pkgdir}/usr/share/libalpm/scripts/${pkgname}-patch"

  sed \
    -e "s#{{executable}}#${_executable}#g" \
    -e "s#{{pkgname}}#${pkgname}#g" \
    -e "s#{{target}}#/usr/bin/${_executable##*/}#g" \
    "$@" \
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
  # Original desktop file points to the symlink target,
  # so we need to fix the desktop file, too
  _package \
    '/opt/1Password/1password' \
    '/usr/share/applications/1password.desktop'
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
