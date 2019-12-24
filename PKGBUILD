# Maintainer: Cody P Schafer <aur [at] codyps [dot] com>
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>
# Contributor: Stefan Seemayer <stefan@seemayer.de>
# Contributor: Alexey Stukalov: <astukalov -at- gmail -dot- com>

pkgbase=tsmclient
pkgname=(tsmclient-service tsmclient-dkms)
pkgver=8.1.9.0
pkgrel=1
pkgdesc="IBM Tivoli Storage Manager Client"
arch=('x86_64')
url="http://www-03.ibm.com/software/products/en/tivostormana/"
license=('proprietary')
depends=('gcc-libs' 'zlib')
makedepends=(libarchive patchelf)
checkdepends=()
optdepends=('jre8-openjdk: support for dsmj java gui')
provides=()
conflicts=()
install=
options=(!strip)

# For 7.1.6.2:
# 7
_ver_major="${pkgver%%.*}"
# 7.1.6
_ver_3="${pkgver%.*}"
# 716
_ver_3_nd="${_ver_3//.}"
# 7.1
_ver_2="${_ver_3%.*}"
# 1
_ver_minor="${_ver_2#*.}"
source=(
	https://public.dhe.ibm.com/storage/tivoli-storage-management/maintenance/client/v${_ver_major}r${_ver_minor}/Linux/LinuxX86/BA/v${_ver_3_nd}/${pkgver}-TIV-TSMBAC-LinuxX86.tar
	dkms.conf
	jbb_version.h
)

sha1sums=('8651fb42f596e360c51fe521d70bb19a57d3be82'
          '9ebfc76be666a44675f0d8e25a37dbe36242c725'
          '46b7b0a46ee50a49d33fd23e0b0a682f162eda65')

prepare() {
	cd "$srcdir/"
	for rpmfile in *.rpm; do
		case "$rpmfile" in
			TIVsm-filepath-*) continue ;;
		esac
		echo "Extracting '$rpmfile'"
		bsdtar -xf $rpmfile
	done

	bsdtar -xf TIVsm-filepath-source.tar.gz
}

package_tsmclient-service() {
	pkgdesc="IBM Tivoli Storage Manager Client and Systemd Service"
	cd "$srcdir/"

	#cp -r "$srcdir/etc" "$pkgdir/"
	cp -r "$srcdir/opt" "$pkgdir/"
	cp -r "$srcdir/usr" "$pkgdir/"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

	ln -s "/opt/tivoli/tsm/client/lang/EN_US" "$pkgdir/opt/tivoli/tsm/client/ba/bin/EN_US"

	for serv in "$srcdir"/opt/tivoli/tsm/client/ba/bin/*.service; do
		install -d "$pkgdir"/usr/lib/systemd/system
		install -m 644 "$serv" "$pkgdir"/usr/lib/systemd/system
	done

	# Permissions even for owner are locked down, fix what we need for now.
	chmod u+rw -R "$pkgdir"/opt/tivoli/tsm/client/ba

	# GSK stuff is in wierd places, tweak rpath to allow it
	# TODO: consider relocating these somewhere else
	for bin in "$pkgdir"/opt/tivoli/tsm/client/ba/bin/{dsmadmc,dsmagent,dsmc,dsmcad,dsmcert,dsmswitch,dsmtrace,tsmjbbd}; do
		if ! [ -x "$bin" ]; then
			>&2 echo "Error: could not find $bin"
			exit 1
		fi
		echo "Patch rpath of $bin"
		patchelf --set-rpath '/usr/local/ibm/gsk8_64/lib64:/opt/tivoli/tsm/client/api/bin64'  "$bin"
	done
}

package_tsmclient-dkms() {
	arch=('any')
	depends=('dkms')
	pkgdesc="IBM Tivoli Storage Manager Client Journal-based Backup Kernel Module"

	dkmsdir="${pkgdir}"/usr/src/${pkgbase}-${pkgver}
	install -d -m 0755 ${dkmsdir}
	install -D -m 0644 "${srcdir}"/{dkms.conf,jbb_version.h} ${dkmsdir}/
	install -m 0644 "${srcdir}"/jbb_gpl/{Makefile,*.c,*.h} ${dkmsdir}/

	sed \
		-e "s/@PKGBASE@/${pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i ${dkmsdir}/{dkms.conf,jbb_version.h}
}
