# Maintainer: SimPilotAdamT <adam_tazul@outlook.com>
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alex Taber <aft dot pokemon at gmail dot com>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Ignacio <nachohc89 at gmail dot com>
# Contributor: Gun Onen <brookline653 at yahoo dot com>
# Contributor: Christian Hesse <mai at eworm dot de>
# Contributor: Yakir Sitbon <kingyes1 at gmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stas S <whats_up at tut dot by>
# Contributor: Hilinus <itahilinus at hotmail dot it>

# TODO: Complete tar install
# TODO: There are missing packages on a fresh Manjaro install'

_opt_Type='D' # D=Debian, R=RPM, T=tar

set -u
pkgname=teamviewer
pkgname+='-beta'
pkgver=15.31.1
pkgrel=1
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.teamviewer.com/en-us/download/linux/'
license=('custom')
options=('!strip')
provides=("teamviewer=${pkgver%%.*}")
conflicts=('teamviewer')
depends=(
	'qt5-base'
	'qt5-declarative'
	'hicolor-icon-theme'
	'qt5-webkit'
	'qt5-x11extras'
	'qt5-quickcontrols' # Doesn't appear in namcap, won't display UI without it.
)
#depends_x86_64=(
# libdepends:
#	'lib32-libxtst'
#	'lib32-libxinerama'
#	'lib32-libxrandr'
#	'lib32-libxdamage'
#	'lib32-fontconfig'
#	'lib32-libsm')
#depends_i686=()
#depends_armv7h=()
optdepends=(
  'teamviewer-openrc: OpenRC scripts'
)
install=teamviewer.install
_dl='https://dl.tvcdn.de'
source_x86_64=("${_dl}/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
source_i686=("${_dl}/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb")
source_armv7h=("${_dl}/download/linux/version_${pkgver%%.*}x/teamviewer-host_${pkgver}_armhf.deb")
#source_armv7h=("${_dl}/download/linux/version_${pkgver%%.*}x/teamviewer-host_13.2.13582_armhf.deb")
sha256sums_i686=('99418ebbccbc75d6b2f1bd5261da2324422cf94c6f89270379a5b40b22cd032a')
sha256sums_x86_64=('e28b4e7fa128d00b792441c72cd451b24b166c10631b5bcf0493053fc9ed67f6')
sha256sums_armv7h=('8dc6a7971137857566224bcb66e884a4d3247fceb720328ba8be5fbe58c2fc15')
sha512sums_i686=('596cecac347b58ed2512e9d1c9c0d74da811f2bcc7f63b525ceacc077a9d422b22a137abfc7eaa7961136d16f9b764afad936aa0431ce0ce2b7164dd3a3ac0e6')
sha512sums_x86_64=('9bf563273a02a67f9b953f45ec82abe20ba01b35e1a2d001b4639387c82af1ff4a5bd1050854ec2b6baedb2c948f0be51b2cee035292e2f1c5e1c620ac37f1cc')
sha512sums_armv7h=('cb7a9e052518bb230691707b207ee9a4865d10eaf3f9aa357d1ba853fe0abc769dda11531f9704312d068f329a602c1d44767a61d99408452da05953ef2aa05d')
#PKGEXT='.tar.gz'

case "${_opt_Type}" in
'R')
  source_x86_64=("${source_x86_64[@]//_amd64.deb/.x86_64.rpm}")
  source_i686=("${source_i686[@]//_i386.deb/.i686.rpm}")
  source_armv7h=("${source_armv7h[@]//_armhf.deb/.armv7hl.rpm}")
  ;;
'T')
  source_x86_64=("${source_x86_64[@]//_amd64.deb/_amd64.tar.xz}")
  source_i686=("${source_i686[@]//_i386.deb/_i386.tar.xz}")
  source_armv7h=("${source_armv7h[@]//_armhf.deb/_armhf.tar.xz}")
  ;;
esac

prepare() {
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
	local datatar
	shopt -s nullglob
	for datatar in data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
	shopt -u nullglob
	sed -i '/function CheckQtQuickControls()/{N;a ls /usr/lib/qt/qml/QtQuick/Controls/qmldir &>/dev/null && return # ArchLinux
}' ./opt/teamviewer/tv_bin/script/teamviewer_setup || msg2 "Patching CheckQtQuickControls failed! Contact maintainer"
	sed -e 's:/var/run/:/run/:g' -i 'opt/teamviewer/tv_bin/script/teamviewerd.service'
}

check() {
	msg2 "Running teamviewer_setup checklibs"
	if ! ./opt/teamviewer/tv_bin/script/teamviewer_setup checklibs; then
		msg2 "teamviewer_setup checklibs failed, contact maintainer with /tmp/teamviewerTARLibCheck/DependencyCheck.log" # Currently it always exits 0
		false
	fi
}

package() {
	# Install
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
	cp -dr --no-preserve=ownership {etc,opt,usr,var} "${pkgdir}"/

	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	rm -rf "${pkgdir}"/etc/apt
	rm -rf "${pkgdir}"/etc/yum.repos.d
	#touch "${pkgdir}/etc/teamviewer/global.conf" # enable later and remove from .install 8/15/2019
	install -d "${pkgdir}/var/log/teamviewer${pkgver%%.*}"
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	sed -e 's: NetworkManager-wait-online.service::g' -i "${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/doc/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
	if [ "$CARCH" = "x86_64" ] && [ -f "${pkgdir}/opt/teamviewer/tv_bin/script/libdepend" ]; then
		msg2 "Removing libdepend to ditch lib32 dependencies"
		rm "${pkgdir}/opt/teamviewer/tv_bin/script/libdepend"
	fi
}
set +u
