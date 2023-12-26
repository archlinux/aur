# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=rez
pkgver=2.114.1
pkgrel=1
pkgdesc='An integrated package configuration, build and deployment system for software'
arch=('any')
url='https://github.com/AcademySoftwareFoundation/rez'
license=('Apache')
depends=('python' 'python-yaml')  # Python 2.7 is supported as well. Replace with python2.
makedepends=('python>=3.7' 'python-pip' 'python-setuptools')
optdepends=('bash-completion: command-line autocomplete with bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/rez/archive/refs/tags/$pkgver.tar.gz")
b2sums=('803d862ec0978b228eb1597800de56e0966a046126bb237b36c3be3fce3cceae96c67cf1dfe88f3138ade926dd8edcace8e0bd2e3ec095c57aa60b2ce46da4f7')

options=(!strip)

prepare() {
    # Adjust output to show that suggestions have been taken
    sed -i 's/^\( *\)\(print(dest_bin_dir)\)/\0\n\1print("[\\033[34mnotice\\033[0m] The PKGBUILD does this for you.")/' "$srcdir/$pkgname-$pkgver/install.py"
    sed -i 's/^\( *\)\(    print(completion_path)\)/\0\n\1print("[\\033[34mnotice\\033[0m] The PKGBUILD does this for you.")/' "$srcdir/$pkgname-$pkgver/install.py"
}

package() {
    # Make sure we are using Python 3
    pyver=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

    # Install
    python$pyver rez-$pkgver/install.py -v "$pkgdir/opt/$pkgname"

    # The venv bakes in $srcdir and $pkgdir and I cannot figure out a proper fix
    find "$pkgdir" -type f -not -name "*.pyc" -exec sed -i "s|$pkgdir||g" {} +
    find "$pkgdir" -type f -name "*.pyc" -exec sh -c 'xxd {} | sed -i "s|'"$pkgdir"'||g" {} | xxd -r > {}' \;
    sed -i 's|"file:///.*"|"https://aur.archlinux.org/packages/'"$pkgname"'"|' "$pkgdir/opt/$pkgname/lib/python$pyver/site-packages/$pkgname-$pkgver.dist-info/direct_url.json"

    # Add to PATH
    mkdir -p "$pkgdir/etc/profile.d"
    echo "set path=(\$path /opt/$pkgname)" >> "$pkgdir/etc/profile.d/$pkgname.csh"
    printf '%s\n' "PATH=\$PATH:/opt/$pkgname/bin/$pkgname" 'export PATH' >> "$pkgdir/etc/profile.d/$pkgname.sh"

    # Create these directories separately to avoid clogging up the verbose output
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"

    # Move autocompletion files
    install -vm644 "$pkgdir/opt/$pkgname/completion/complete.csh" "$pkgdir/etc/profile.d/$pkgname-complete.csh"
    install -vm644 "$pkgdir/opt/$pkgname/completion/complete.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -vm644 "$pkgdir/opt/$pkgname/completion/complete.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    rm "$pkgdir/opt/$pkgname/completion/complete."{csh,sh,zsh}
}

