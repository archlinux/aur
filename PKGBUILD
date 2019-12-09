# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-itasks-dev-bin
pkgver=20191209
pkgrel=1
pkgdesc="Provides the functional programming language Clean and the iTasks system."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom')
depends=('bash')
conflicts=('clean-lang' 'clean-lang-bin')
provides=('clean-lang' 'clean-lang-bin')
replaces=('clean-lang' 'clean-lang-bin')
install=clean-env.install
source=("https://ftp.cs.ru.nl/Clean/builds/linux-x64/clean-bundle-complete-linux-x64-${pkgver}.tgz"
        'clm-wrapper.sh'
        'cpm-wrapper.sh'
        'clenv.sh'
        'README.md')
sha256sums=('b0939bcc5a4bf4e4d649c53a1677b3e940d86e467b0a5ab88dcbda659c98ef26'
            '27ab09f375d07b2d05c2c4367a47c60b05593059d6e6edc0434ee7d66b5119b8'
            'f8303a73262dc163459019916f45bfeb558fb7bebbf2fde372fa839f44b0de03'
            '6f839935dab80a4c687dc7bcb980682d56c1c2dadfff6937c1b69c04d36a5f9b'
            'f14afbd04e301269efbf7418677c3ad8d79b92f92e884e4f1146bc655117014b')

# originally clean packages were not dated, so pkgver had to be determined from
# a version file within the archive. We are keeping this for the moment.
#pkgver() {
#	cd "${pkgname/-itasks-dev-bin/}-bundle-complete"
#
#    # extract timestamp from TGZ, truncate and use as version number
#    #tar -t -v --full-time -f clean-bundle-complete-linux-x64-latest.tgz | head -n1 \
#    #    | cut -d' ' -f10 | tr -d '-'
#
#    # or alternatively get it directly from the Info file
#    head -n1 Info/clean-bundle-complete-info.txt | cut -d' ' -f4
#}

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
