# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-lang-bin
pkgver=3.0
pkgrel=5
pkgdesc="Provides the general purpose, pure and lazy functional programming language Clean."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom')
depends=('bash')
conflicts=('clean-lang')
provides=('clean-lang')
replaces=('clean-lang')
source=("https://ftp.cs.ru.nl/Clean/Clean30/linux/clean${pkgver}_64.tar.gz"
        'clm-wrapper.sh'
        'clenv.sh')
sha256sums=('c71024cc6d27df357fed771a75f5d43e584369c3ee963bfd6d5cffe9af731ca8'
            '70d90c34c0c9716b59cb843a7a617c986f56810a70342be3d4c2389436317c82'
            'c190821ac6c72d159c9713fba3140b886d5d1716021bf8e28b676418774d0915')

package() {
	cd "${pkgname/-lang-bin/}"

    local _install_dir="${pkgdir}/usr"
    local _install_bin_dir="${_install_dir}/libexec/${pkgname}"
    local _install_man_dir="${_install_dir}/share/man"
    local _install_exe_dir="${_install_dir}/libexec/${pkgname}/exe"

    # install the main files (does a bit of compiling as well...)
	make INSTALL_DIR="$_install_dir" INSTALL_BIN_DIR="$_install_bin_dir" \
        INSTALL_EXE_DIR="$_install_exe_dir" INSTALL_MAN_DIR="$_install_man_dir" install

    # resolve permissions on binaries
    chmod go+r "${_install_bin_dir}/BatchBuild" "${_install_bin_dir}/clm" \
        "${_install_bin_dir}/htoclean" "${_install_exe_dir}/cg" \
        "${_install_exe_dir}/cocl" "${_install_exe_dir}/linker"

    # add missing binaries
    install -Dm755 "bin/cpm" "${_install_bin_dir}/cpm"
    install -Dm755 "bin/patch_bin" "${_install_bin_dir}/patch_bin"

    # add wrapper(s) and symlinks
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/clm-wrapper.sh" "$pkgdir/usr/bin/clm"
    install -Dm755 "$srcdir/clenv.sh" "$pkgdir/usr/bin/clenv"
    ln -s "/usr/libexec/${pkgname}/htoclean" "$pkgdir/usr/bin/htoclean"
    ln -s "/usr/libexec/${pkgname}/BatchBuild" "$pkgdir/usr/bin/BatchBuild"
    ln -s "/usr/libexec/${pkgname}/cpm" "$pkgdir/usr/bin/cpm"
    ln -s "/usr/libexec/${pkgname}/patch_bin" "$pkgdir/usr/bin/patch_bin"

    # remove empty dir
    rmdir "$pkgdir/usr/Temp"
    rmdir "$pkgdir/usr/lib/Generics/Clean System Files"
    rmdir "$pkgdir/usr/lib/MersenneTwister/Clean System Files"
    rmdir "$pkgdir/usr/lib/Dynamics/Clean System Files"
    rmdir "$pkgdir/usr/lib/StdLib/Clean System Files"

    # install license
    install -Dm644 CleanLicenseConditions.txt \
        "$pkgdir/usr/share/licenses/${pkgname}/CleanLicenseConditions.txt"
}
