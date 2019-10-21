# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-itasks-dev-bin
pkgver=20191021
pkgrel=1
pkgdesc="Provides the functional programming language Clean and the iTasks system."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom')
depends=('bash')
conflicts=('clean-lang' 'clean-lang-bin')
provides=('clean-lang' 'clean-lang-bin')
replaces=('clean-lang' 'clean-lang-bin')
source=('https://ftp.cs.ru.nl/Clean/builds/linux-x64/clean-bundle-complete-linux-x64-latest.tgz'
        'clm-wrapper.sh'
        'cpm-wrapper.sh'
        'clenv.sh')
sha256sums=('2420fab49df9e325bd379659d9a3b86bbed7b420329330ee92e52a09a35a2c09'
            'fb1a94763518b7bc583ea29fc97d5accac1644da0bbee8f7b082fde904fe6bce'
            '353ae04913cd1c6a27e31738b8f69c35394180b0b3f083d30d21d4b636df8955'
            '88ec2dd869af3e4a5beebde6878b0eb71a381932b885fb6b679a47c76d5e5c7b')

pkgver() {
	cd "${pkgname/-itasks-dev-bin/}-bundle-complete"

    # extract timestamp from TGZ, truncate and use as version number
    #tar -t -v --full-time -f clean-bundle-complete-linux-x64-latest.tgz | head -n1 \
    #    | cut -d' ' -f10 | tr -d '-'

    # or alternatively get it directly from the Info file
    head -n1 Info/clean-bundle-complete-info.txt | cut -d' ' -f4
}

package() {
	cd "${pkgname/-itasks-dev-bin/}-bundle-complete"

    local _install_dir="${pkgdir}/opt/${pkgname}"

    # create the main install directory
    install -d "${_install_dir}"

    # copy things over
    cp -r bin "${_install_dir}"
    cp -r doc "${_install_dir}"
    cp -r etc "${_install_dir}"
    cp -r lib "${_install_dir}"
    cp -r examples "${_install_dir}"

    # add wrapper(s) and symlinks
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/clm-wrapper.sh" "$pkgdir/usr/bin/clm"
    install -Dm755 "$srcdir/cpm-wrapper.sh" "$pkgdir/usr/bin/cpm"
    install -Dm755 "$srcdir/clenv.sh" "$pkgdir/usr/bin/clenv"

    # install license
    install -Dm644 CleanLicenseConditions.txt \
        "$pkgdir/usr/share/licenses/${pkgname}/CleanLicenseConditions.txt"
}
