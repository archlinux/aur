# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=rez
pkgver=3.1.1
pkgrel=2
pkgdesc='An integrated package configuration, build and deployment system for software'
arch=('any')
url='https://github.com/AcademySoftwareFoundation/rez'
license=('Apache')
depends=('python>=3' 'python<3.12' 'python-yaml')
makedepends=('python>=3.7' 'python-pip' 'python-setuptools')
optdepends=('bash-completion: command-line autocomplete with bash'
            'cmake: alternative build system')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/rez/archive/refs/tags/$pkgver.tar.gz")
b2sums=('54e08c1641c63698ce86ff8e5d8a7edb220dc4efdbbda4b272352889d67947358cbc0b82766635c5ded7d96e59c366367ddfcc35b54b0d7e8fe9a717eca1621d')

options=(!strip)

prepare() {
    # Adjust output to show that suggestions have been taken
    sed -i 's/^\( *\)\(print(dest_bin_dir)\)/\0\n\1print("[\\033[34mnotice\\033[0m] The PKGBUILD does this for you.")/' "$srcdir/$pkgname-$pkgver/install.py"
    sed -i 's/^\( *\)\(    print(completion_path)\)/\0\n\1print("[\\033[34mnotice\\033[0m] The PKGBUILD does this for you.")/' "$srcdir/$pkgname-$pkgver/install.py"
}

package() {
    # Not sure if anyone else uses this package, so I don't have an automated solution.
    # Please just set the Python version below.
    pyver=3.11

    # Install
    python$pyver rez-$pkgver/install.py -v "$pkgdir/opt/$pkgname"

    # The venv bakes in $srcdir and $pkgdir, and I cannot figure out a proper fix
    find "$pkgdir" -type f -not -name "*.pyc" -exec sed -i "s|$pkgdir||g" {} +
    find "$pkgdir" -type f -name "*.pyc" -exec sh -c 'xxd {} | sed -i "s|'"$pkgdir"'||g" {} | xxd -r > {}' \;
    sed -i 's|"file:///.*"|"https://aur.archlinux.org/packages/'"$pkgname"'"|' "$pkgdir/opt/$pkgname/lib/python$pyver/site-packages/$pkgname-$pkgver.dist-info/direct_url.json"

    # Add to PATH
    mkdir -p "$pkgdir/etc/profile.d"
    echo "set path=(\$path /opt/$pkgname/bin/$pkgname)" >> "$pkgdir/etc/profile.d/$pkgname.csh"
    printf '%s\n' "PATH=\$PATH:/opt/$pkgname/bin/$pkgname" 'export PATH' >> "$pkgdir/etc/profile.d/$pkgname.sh"

    # Create these directories separately to avoid clogging up install's verbose output
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"

    # Move autocompletion files
    install -vm644 "$pkgdir/opt/$pkgname/completion/complete.csh" "$pkgdir/etc/profile.d/$pkgname-complete.csh"
    install -vm644 "$pkgdir/opt/$pkgname/completion/complete.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -vm644 "$pkgdir/opt/$pkgname/completion/complete.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    rm "$pkgdir/opt/$pkgname/completion/complete."{csh,sh,zsh}
}

