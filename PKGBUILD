# Mantainer: Marc Vidal <mvidal.dp at gmail dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: klepz <felipe.junger@aluno.ufabc.edu.br>
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=chrome-remote-desktop-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname=${pkgname%-git}
pkgver=r123.0.6312.16
pkgrel=1
pkgdesc="Securely access your computer over the Internet through your web browser (current version)."
arch=("x86_64")
url="https://remotedesktop.google.com"
license=("BSD")
depends=("dpkg" "gtk3" "libutempter" "libxss" "nss" "python-packaging" "python-psutil" "python-pyxdg" "xf86-video-dummy" "xorg-server-xvfb" "xorg-setxkbmap" "xorg-xauth" "xorg-xdpyinfo" "xorg-xrandr")
makedepends=("curl" "git") # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
source=(
	"${_pkgname}_${pkgver#r}.deb::https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb"
	"${_pkgname}.service"
	"pamrule"
	"crd"
	"xdg-base-directory.patch"
)
sha256sums=(
	"SKIP"
	"e5da5ae89b5bc599f72f415d1523341b25357931b0de46159fce50ab83615a4b"
	"fcc38269eb1cc902abff9688eda9377a22367e39b9f111f87c0dd8e77adb82e2"
	"021110f49d465294517eec92eeb24ebca41e264ef33cbdda78732add1f269d02"
	"90bcfab85a87cfa6d038a55c556206f74b22eb03644ea51f46732cfb27679963"
)

pkgver() {
	VER=$(curl -qs https://dl.google.com/linux/chrome-remote-desktop/deb/dists/stable/main/binary-amd64/Packages | grep "^Version\|^SHA256" | awk '{print $2}' | head -n 1)
	printf "r%s" "${VER}"
}

prepare() {
	cd "${srcdir}"

	bsdtar -xf data.tar.xz -C .

	# Removing unnecessary .deb related files
	rm -R "${srcdir}/etc/cron.daily"
	rm -R "${srcdir}/etc/init.d"
	rm -R "${srcdir}/etc/pam.d"

	# Fix problem with missing import xdg.BaseDirectory, fixing xorg_binary location
	patch -Np1 -i "${srcdir}/xdg-base-directory.patch"
}

package() {
	cd "${srcdir}"

	install -d "${pkgdir}/etc"
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/etc/"* "${pkgdir}/etc"
	cp -r "${srcdir}/opt/"* "${pkgdir}/opt"
	install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/copyright"
	install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
	install -Dm644 "${srcdir}/lib/systemd/system/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -Dm644 "${srcdir}/pamrule" "${pkgdir}/etc/pam.d/${_pkgname}"
	install -Dm755 "${srcdir}/crd" "${pkgdir}/usr/bin/crd"
	install -dm755 "${pkgdir}/etc/chromium/native-messaging-hosts"

	for _file in $(find "${pkgdir}/etc/opt/chrome/native-messaging-hosts" -type f); do
		local _filename=$(basename "${_file}")
		if [[ ! -f "/etc/chromium/native-messaging-hosts/${_filename}" ]]; then
			ln -s "/etc/opt/chrome/native-messaging-hosts/${_filename}" "${pkgdir}/etc/chromium/native-messaging-hosts/${_filename}"
		fi
	done
	chmod u+s "${pkgdir}/opt/google/${_pkgname}/user-session"
}
