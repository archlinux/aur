# Maintainer: ghesy <ehsan at disroot dot org>
# Contributor: mizumo-prjkt <mizproject@proton.me>

pkgname=odin4-cli
pkgver=1.2.1.dc05e3ea
pkgrel=2

pkgdesc="an Odin4 binary for flashing Samsung firmware"
url='https://forum.xda-developers.com/t/official-samsung-odin-v4-1-2-1-dc05e3ea-for-linux.4453423/'

arch=('x86_64')
license=('custom:Samsung')

depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://github.com/MizProject/mizrepo/raw/refs/heads/main/aur/amd64/odin4-cli/odin4-cli-1.2.1.dc05e3ea.zip"
            "60-odin4.rules")
sha256sums=('ac1cd7fdf5330ab25c052da8646f9cd114fc88a5742cf84f5e960bbffcf106a4'
            '286344abeb036d9c9341396653eaaefc1c7376adb345cbb7b58a126056a3a40f')

# don't modify prebuilt binaries
options=('!strip')

prepare()
{
	# extract the license text from the odin4 binary
	_sep='__SEPARATOR__'
	strings --include-all-whitespace --output-separator "$_sep" odin4 |
		awk -v RS="$_sep" '$0 ~ /\<Copyright\>.*\<Samsung\>/ {print $0}' \
		> LICENSE.txt
}

package()
{
	install -Dm755 odin4         -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE.txt   -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	# Install the udev rules, as odin4 util suggests
	install -Dm644 60-odin4.rules -t "${pkgdir}/etc/udev/rules.d/"
}
