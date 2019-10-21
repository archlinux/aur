# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-itasks-dev-bin
pkgver=20191021
pkgrel=2
pkgdesc="Provides the functional programming language Clean and the iTasks system."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom')
depends=('bash')
conflicts=('clean-lang' 'clean-lang-bin')
provides=('clean-lang' 'clean-lang-bin')
replaces=('clean-lang' 'clean-lang-bin')
install=clean-env.install
source=('https://ftp.cs.ru.nl/Clean/builds/linux-x64/clean-bundle-complete-linux-x64-latest.tgz'
        'clm-wrapper.sh'
        'cpm-wrapper.sh'
        'clenv.sh'
        'README.md')
sha256sums=('2420fab49df9e325bd379659d9a3b86bbed7b420329330ee92e52a09a35a2c09'
            '27ab09f375d07b2d05c2c4367a47c60b05593059d6e6edc0434ee7d66b5119b8'
            'f8303a73262dc163459019916f45bfeb558fb7bebbf2fde372fa839f44b0de03'
            '6f839935dab80a4c687dc7bcb980682d56c1c2dadfff6937c1b69c04d36a5f9b'
            'c26f925dfcd093674f35efc6e3d2c6e921dde292dd48aef3eed4f7af443ad378')

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
    # install readme
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
