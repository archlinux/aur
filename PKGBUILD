# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-lang-bin
pkgver=3.1
pkgrel=1
pkgdesc="Provides the general purpose, pure and lazy functional programming language Clean."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom')
depends=('bash')
conflicts=('clean-lang')
provides=('clean-lang')
replaces=('clean-lang')
options=('!strip')
install=clean.install
source=("https://ftp.cs.ru.nl/Clean/Clean31/linux/clean${pkgver}_64.tar.gz"
        'clenv.sh')
sha256sums=('ffb03e65798246215a8c217cdbaf33fa29ae5b110cc54b144e989bb9537b3fbb'
            '152704ef3e39b5aa8944af762568e034a51d72b192beb42f7da2fb1e5ceac502')

package() {
	cd "${pkgname/-lang-bin/}"

    local _install_dir="${pkgdir}/opt/${pkgname}"

    # install the main files (does a bit of compiling as well...)
	make INSTALL_DIR="$_install_dir" install

    # resolve permissions on binaries
    chmod go+r "${_install_dir}/bin/clm" "${_install_dir}/lib/exe/cocl_itask" \
        "${_install_dir}/bin/htoclean" "${_install_dir}/lib/exe/cg" \
        "${_install_dir}/lib/exe/cocl" "${_install_dir}/lib/exe/linker"

    # add missing binarie
    install -Dm755 "bin/cpm" "${_install_dir}/bin/cpm"
    install -Dm755 "bin/patch_bin" "${_install_dir}/bin/patch_bin"

    # add wrapper(s) and symlinks
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/clenv.sh" "$pkgdir/usr/bin/clenv"

    # install license
    install -Dm644 CleanLicenseConditions.txt \
        "$pkgdir/usr/share/licenses/${pkgname}/CleanLicenseConditions.txt"
}
