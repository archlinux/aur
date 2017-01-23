# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor:

pkgname=netbeans-javaee
pkgver=8.2
pkgrel=2
pkgdesc='Netbeans IDE for Java EE'
arch=('any')

url='https://netbeans.org'
license=('CDDL')

makedepends=('gendesk' 'setconf')
depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'atk')
provides=('netbeans')
conflicts=('netbeans')

options=(!strip)

# src.: https://netbeans.org/downloads/zip.html
# Even if the netbeans package has an icon integrated in the archive, we
# are using the one from the chocolatey package which is basically larger.
source=(
    'http://download.netbeans.org/netbeans/8.2/final/zip/netbeans-8.2-201609300101-javaee.zip'
    'https://cdn.rawgit.com/ComFreek/chocolatey-packages/779f5c96f817ed1fa0d76fd90841873dc6c0ba74/icons/netbeans.png'
)
sha512sums=(
    cf4cb469370e060bc6ba4f65fc5da8c308cbfbbcc810976ba752a06eedf3d2fd7845928355a2d80c41d37d85a859a1cd1183b4972de67ffc1bc58fa73202f707
    875099689e9ddcb3700defe01c68ef4ced3539f3a8bcfd9fdf605632ce1069a9b95ec16cf4fbd01f07958d3dbad659614daacd7af7ecb95cda43b48f456c74fb
)

prepare() {
	cd "${srcdir}"

    # The zip file comes with files for other OS as well, let's remove them.
    rm $(find -name '*\.exe' -or -name '*\.bat' -or -name '*\.dll')
    rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*' -or -name 'FreeBSD*')
    rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')

    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # The additional non standard StartupWMClass argument is used to let know to
    # modern Linux environments what is the exact application name used in the
    # launcher. This is indeed an issue, as this is java responsible of
    # launching the application. src.: http://askubuntu.com/a/367851
    gendesk -f -n --pkgname "netbeans" --pkgdesc "$pkgdesc" \
    --custom "StartupWMClass=NetBeans IDE $pkgver" --name "NetBeans" \
    --exec 'netbeans %f' --startupnotify true

    # The /etc/netbeans.conf should be prefixed by /usr/share/netbeans/ and not
    # by the current working directory.
    setconf "netbeans/bin/netbeans" basedir "/usr/share/netbeans"

    # Replace the JDK home to the correct one Arch uses. /usr/lib/jvm/default
    # is symlinked to the default Arch JDK.
    # -i means replace in place (in the file)
    # /g means replace globally, not only the first occurrence
    sed -i 's/#netbeans_jdkhome="\/path\/to\/jdk"/netbeans_jdkhome="\/usr\/lib\/jvm\/default"/g' netbeans/etc/netbeans.conf
}

package() {
    mkdir -p "$pkgdir/usr/"{bin,share/netbeans}

	cp -r "$srcdir/netbeans" "$pkgdir/usr/share/"
	ln -s /usr/share/netbeans/bin/netbeans "${pkgdir}/usr/bin/netbeans"

    # Desktop shortcut and icon
	install -Dm644 netbeans.desktop "${pkgdir}/usr/share/applications/netbeans.desktop"
    install -Dm644 "$srcdir/netbeans.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
