# Maintainer: Akira-Amatsume <akira.uestc at gmail dot com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>

pkgbase="stm32cubeclt"
pkgname="stm32cubeclt"
# pkgname=("stm32cubeclt" "stlink-server" "stlink-udev-rules")
_pkgname="STM32CubeCLT"
pkgver=1.22.0
pkgrel=1
_pkgdesc="A toolset for third-party integrated development environment (IDE) providers, allowing the use \
of STMicroelectronics proprietary tools within their own IDE frameworks."
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubeclt.html"
license=('custom:SLA0048')
makedepends=('tar'
             'bash')
options=('!strip')

_prefix="29188"
_date="20260626"
_suffix="1359"
_pkg_name="${pkgbase}_${pkgver}"
_pkg_license_name="SLA0048_${_pkgname}.txt"
_pkg_sh_name="${_pkg_name}_${_prefix}_${_date}_${_suffix}-Lin-x86_64.sh"
_pkg_tar_name="${_pkg_name}_${_prefix}_${_date}_${_suffix}-Lin.tar.gz"
_pkg_zip_name="${_pkg_name}-Lin-x86_64.sh.zip"

if [[ "$(ps -o args=$PID 2>/dev/null)" != *"--printsrcinfo"* ]]; then
  if [ ! -f "${SRCDEST:-$startdir}/${_pkg_zip_name}" ] && [ ! -f "${startdir}/${_pkg_zip_name}" ]; then
    xdg-open "$url" &>/dev/null &
    notify-send -i "web-browser" "STM32CubeCLT" \
      "Log in to st.com, download ${_pkg_zip_name} and save it to ${startdir}" 2>/dev/null || true
    echo ""
    echo "==> Package file not found: ${_pkg_zip_name}"
    echo "==> Browser opened: $url"
    echo "==> Log in, download ${_pkg_zip_name} (The Part Number is STM32CubeCLT-Lnx), save it to: ${startdir}"
    echo "==> Press Enter once the file is saved..."
    read -r _
  fi
fi

source=("local://${_pkg_zip_name}")
sha256sums=('8bebfb8811e28dcc26977c058a6109cdea4bcc930b2c4cf833d8309036b93b0d')

# not used, reserved.
_pkgname_stlink_server="stlink-server"
_pkgname_stlink_udev_rules="stlink-udev-rules"
_pkgver_stlink_server="2.1.1-1"
_pkgver_stlink_udev_rules="1.1.0-1"

# not used, reserved.
_pkg_stlink_server_name="${_pkgname_stlink_server}.${_pkgver_stlink_server}"
_pkg_stlink_udev_rules_name="${_pkgname_stlink_udev_rules}-${_pkgver_stlink_udev_rules}"
_pkg_stlink_server_sh_name="st-${_pkg_stlink_server_name}-linux-amd64.install.sh"
_pkg_stlink_udev_rules_sh_name="st-${_pkg_stlink_udev_rules_name}-linux-noarch.sh"

_bundle_sh_extract() {
  local bundle_sh="$1"
  local target="$2"

  chmod u+x "${bundle_sh}"
  rm -rf "${target}"
  ./${bundle_sh} --noexec --target "${target}"
}

_create_profile_script() {
  local profile=$1
  local pkg_root_dir=/opt/${pkgname}

  local cubeprog_bindir="${pkg_root_dir}/STM32CubeProgrammer/bin"
  local stlinkgdb_bindir="${pkg_root_dir}/STLink-gdb-server/bin"
  local gnu_bindir="${pkg_root_dir}/GNU-tools-for-STM32/bin"
  local cmake_bindir="${pkg_root_dir}/CMake/bin"
  local make_bindir="${pkg_root_dir}/Make/bin"
  local ninja_bindir="${pkg_root_dir}/Ninja/bin"
  local clang_root="${pkg_root_dir}/st-arm-clang"
  local clang_bindir="${clang_root}/bin"
  local metadata_dir="${pkg_root_dir}"

  echo "Installing shell profile $(basename ${profile})..."
  install -Dm644 /dev/stdin "${profile}" << END
# Set OVERRIDE_SYSTEM_TOOLS to 1 to prioritize
# the use of tools provided by stm32cubeclt.
OVERRIDE_SYSTEM_TOOLS=0

prepend_path () {
    case ":\$PATH:" in
        *:"\$1":*)
            ;;
        *)
            PATH="\$1\${PATH:+:\$PATH}"
    esac
}

append_path () {
    case ":\$PATH:" in
        *:"\$1":*)
            ;;
        *)
            PATH="\${PATH:+\$PATH:}\$1"
    esac
}

if [ \$OVERRIDE_SYSTEM_TOOLS -ge 1 ];then
  prepend_path "$gnu_bindir"
  prepend_path "$clang_bindir"
  prepend_path "$ninja_bindir"
  prepend_path "$make_bindir"
  prepend_path "$cmake_bindir"
  prepend_path "$stlinkgdb_bindir"
  prepend_path "$cubeprog_bindir"
  prepend_path "$metadata_dir"
else
  append_path "$metadata_dir"
  append_path "$cubeprog_bindir"
  append_path "$stlinkgdb_bindir"
  append_path "$cmake_bindir"
  append_path "$make_bindir"
  append_path "$ninja_bindir"
  append_path "$clang_bindir"
  append_path "$gnu_bindir"
fi

export PATH
export CLANG_GCC_CMSIS_COMPILER="$clang_root"
export GCC_TOOLCHAIN_ROOT="$gnu_bindir"
END

}

_install_license() {
  local license_source="${srcdir}/${_pkg_name}/prompt_linux_license.sh"

  echo "Installing license ${_pkg_license_name}..."
  grep -q '^SLA0048 Rev' "${license_source}"
  awk '
    /^cat << EOF$/ { copying = 1; next }
    copying && /^EOF$/ { exit }
    copying { sub(/\r$/, ""); print }
  ' "${license_source}" | install -Dm644 /dev/stdin \
      "${pkgdir}/usr/share/licenses/${pkgname}/${_pkg_license_name}"
}

prepare() {
  cd ${srcdir}
  
  local pkg_target=${_pkg_name}
  local stlink_server_target=${_pkg_name}/${_pkg_stlink_server_name}
  local stlink_udev_rules_target=${_pkg_name}/${_pkg_stlink_udev_rules_name}
 
  _bundle_sh_extract ${_pkg_sh_name} ${pkg_target}

  # not used, reserved.
  _bundle_sh_extract ${_pkg_name}/${_pkg_stlink_server_sh_name} \
                      ${stlink_server_target}
  _bundle_sh_extract ${_pkg_name}/${_pkg_stlink_udev_rules_sh_name} \
                      ${stlink_udev_rules_target}
}

package_stm32cubeclt() {
  pkgdesc="${_pkgdesc} - CLT for STM32"
  # FIXME depends on ncurses, python2.7?
  # libusb1.0.12 version or higher is required to run STM32CubeProgrammer.
  # stlink provides stlink udev rules
  depends=('stlink'
           # "stlink-udev-rules"
           'libusb'
           'stlink-server'
           # 'ncurses'
           # 'python2'
           )
  install="$pkgname.install"

  cd ${srcdir}/${_pkg_name}
  
  local version=$(cat version.txt)
  local profile="cubeclt-bin-path_${version}.sh"

  echo "Installing ${_pkgname} ${version}..."
  install -dm755 ${pkgdir}/opt/${pkgname}
  tar -xf ${_pkg_tar_name} -C ${pkgdir}/opt/${pkgname}

  _create_profile_script "${pkgdir}/etc/profile.d/${profile}"

  _install_license
}

# not used, split to stand-alone stlink-server on AUR https://aur.archlinux.org/packages/stlink-server.
package_stlink-server() {
  # pkgver=${_pkgver_stlink_server}
  pkgdesc="${_pkgdesc} - stlink tcp server to permit several applications to share the same usb device"
  # stlink provides stlink udev rules
  depends=("stlink"
           # "stlink-udev-rules"
           "libusb")

  cd ${srcdir}/${_pkg_name}/${_pkg_stlink_server_name}
  
  chmod u+x ./stlink-server
  set junk  $(./stlink-server 2>&1 -v)

  version_string=$3
  timestamp=$4
  echo "Installing stlink-server ${version_string} ${timestamp}..."
  install -Dm755 ${_pkgname_stlink_server} -t ${pkgdir}/usr/bin

  _install_license
}

# not unsed, replace it with stlink package from offical repo
package_stlink-udev-rules() {
  # pkgver=${_pkgver_stlink_udev_rules}
  pkgdesc="${_pkgdesc} - STLink udev rules"
  depends=('systemd') #depends on udev

  cd ${srcdir}/${_pkg_name}/${_pkg_stlink_udev_rules_name}

  echo "Installing stlink-udev-rules..."
  for _udev_rule in ./*.rules; do
    install -Dm644 "${_udev_rule}" -t "${pkgdir}/usr/lib/rules.d/"
  done

  _install_license
}
# vim: set sw=2 ts=2 et:
