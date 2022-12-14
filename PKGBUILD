# Maintainer:  ghesy <ehsan at disroot dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def
# Contributor: navigaid <navigaid@gmail.com>

_name=naiveproxy
_version=v108.0.5359.94-1
pkgrel=1
pkgdesc='Camouflage network traffic with strong censorship resistence and low detectablility.'
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')

pkgname=${_name}-bin
pkgver=${_version//-/_}
pkgver=${pkgver#v}

provides=("${_name}")
conflicts=("${_name}")
depends=('gcc-libs')
backup=('etc/naiveproxy/config.json')
options=('!strip') # don't modify prebuilt binaries

_ext='tar.xz'
_source="${url}/releases/download/${_version}/naiveproxy-${_version}-linux-@SRCARCH@.${_ext}"

declare -Ag _archmap=(
#	[ARCH]=SRCARCH
	[x86_64]=x64
	[i686]=x86
	[aarch64]=arm64
	[armv7h]=arm
	[mips64el]=mips64el
	[mipsel]=mipsel
)

package() {
	cd "naiveproxy-${_version}-linux-${_archmap[$CARCH]}"
	install -Dm755 naive         "${pkgdir}/usr/bin/naiveproxy"
	install -Dm644 config.json   "${pkgdir}/etc/${_name}/config.json"
	install -Dm644 USAGE.txt     "${pkgdir}/usr/share/doc/${_name}/USAGE.txt"
	install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums_x86_64=('e0a9854cb9351cfb5cf05a13d525571b8d1b1f4cc507759e28058adde938fac8')
sha256sums_i686=('cceb04abc7d1145f21bc348df4f7a0d927fa9be00410eb20710150d7b85df935')
sha256sums_aarch64=('2bba2135d21f9672389703c6e8d423a424163a7573d61f02c32e8acd913578e7')
sha256sums_armv7h=('9c3977716201e6e0deee6917b43880181862af4a0bac4e60b0ca4acc88dc46cf')
sha256sums_mips64el=('262eefc173afeae53acffe5a3d5119654853fd34bd83c243a43d67b35b3e1a64')
sha256sums_mipsel=('c97679323f4382ef4d47af1f66a6a3e0a61884b95ea8cdff67b84e7fd2ffa730')

# boilerplate for generating the 'arch' and 'source_<arch>' arrays
arch=("${!_archmap[@]}")
for _a in "${!_archmap[@]}"; do
	_sa=${_archmap[$_a]}
	_s=${_source/@SRCARCH@/$_sa}
	_n="${_name}-${_version}-${_a}.${_ext}"
	declare -ag "source_${_a}=(${_n}::${_s})"
done
