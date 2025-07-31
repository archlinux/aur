# Maintainer: kumen
# Contributor: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

pkgname=stlink-server
pkgver=2.1.1
pkgrel=9
pkgdesc="An application to share the debug interface of a single ST-LINK board among several host applications, typically a debugging tool and a monitoring tool"
arch=('x86_64')
url="https://www.st.com/en/development-tools/st-link-server.html"
license=('custom:SLA0048')
# stlink provides stlink udev rules
depends=("stlink" "libusb")

# Non-uniform name conventions
_pkg_file_name="st-link-server-v${pkgver//./-}.zip"
_pkg_uncompress_dir="en.st-link-server_v${pkgver}-2"
_stlink_server_bin="${pkgname}.${pkgver}-1"
_pkg_license_name="SLA0048_${pkgname}.pdf"

if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	echo ""
	echo "Package not found!"
	echo "The ${pkgname} can be downloaded here: ${url}"
	echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory (${PWD}) before build."
	echo ""
fi

# Download cookies
curl -s --compressed --cookie-jar "${srcdir}http_cookies" -H "@${srcdir}http_headers" "$url" > /dev/null

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              --cookie "${srcdir}http_cookies" \
              -H "@${srcdir}http_headers" \
              -o %o --compressed %u")
              
source=("local://${_pkg_file_name}"
        'http_headers'
        "${_pkg_license_name}::https://www.st.com/resource/en/license_agreement/dm00218346.pdf")
sha256sums=('a84a0ada7c9b6343e559dacd37e42a815c500d0f4a517db3d1e511d056903bf6'
            '9dc2b328903592d5f99d99eca176b4c3fb7a7a9ce1cfef1f8dfb334633046345'
            'SKIP')

package() {
  cd ${srcdir}/${_pkg_uncompress_dir}
  
  chmod u+x ${_stlink_server_bin}

  # Extract version and timestamp from binary file
  set junk  $(./${_stlink_server_bin} 2>&1 -v)
  version_string=$3
  timestamp=$4
  
  echo "Installing ${pkgname} ${version_string} ${timestamp}..."
  install -Dm 755 ${_stlink_server_bin} ${pkgdir}/usr/bin/${pkgname}

  echo "Installing license ${_pkg_license_name}..."
  install -Dm 644 ${srcdir}/${_pkg_license_name} -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set sw=2 ts=2 et:
