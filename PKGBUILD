pkgname=manuskript-git
pkgver=20161213_8d23989
pkgrel=1
arch=('any')

pkgdesc="Manuskript is an open-source tool for writers (git version)."
url="http://www.theologeek.ch/manuskript"
license=('GPL3')

makedepends=('git')
depends=('python' 'python-pyqt5' 'qt5-svg' 'python-lxml')
provides=('manuskript')
conflicts=('manuskript' 'manuskript-git')

source=("${pkgname}::git+https://github.com/olivierkes/manuskript#branch=develop")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --date=format:%Y%m%d --pretty=format:%ad_%h
}

# base desktop launcher, missing only the icon
read -r -d '' _base_desktop_launcher << EndOfMessage
[Desktop Entry]
Comment=An open-source tool for writers.
Name=Manuskript
Terminal=false
Type=Application
EndOfMessage

package() {
    local install_location="/opt"
    local bin_location="/usr/local/bin"

    # program files
    local pkg_install_location="${pkgdir}${install_location}"
    mkdir -p "$pkg_install_location"
    rsync -av "${srcdir}/${pkgname}/" "${pkg_install_location}/Manuskript" --exclude '.git'

    # symlink to the binary folder
    local pkg_bin_location="${pkgdir}${bin_location}"
    mkdir -p "$pkg_bin_location"
    ln -s "${install_location}/Manuskript/bin/manuskript" "${pkg_bin_location}/manuskript"

    # desktop launcher
    mkdir -p "${pkgdir}/usr/share/applications"

    local desktop_launcher_file="${pkgdir}/usr/share/applications/manuskript.desktop"
    printf "$_base_desktop_launcher" > "$desktop_launcher_file"
    printf "\nIcon=${install_location}/Manuskript/icons/Manuskript/icon-512px.png" >> "$desktop_launcher_file"
    printf "\nExec=${install_location}/Manuskript/bin/manuskript %%U" >> "$desktop_launcher_file"
}
