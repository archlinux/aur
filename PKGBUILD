# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="simple-signer"
pkgver="1.5.5"
pkgrel="2"
pkgdesc="Sign PDF files using a simple GUI."
url="https://github.com/schorschii/Simple-Signer"
license=("GPL-3.0-only")
source=("$pkgname-git::git+$url.git#commit=v$pkgver" "$pkgname.png")
b2sums=("SKIP" "975874462b04d04c4cb8e7305e410fc3f8df1ca17f5507a0f5faf373444960e8d0a124c0ffa0493872fed6bcace6faad26df3bd54bcea2879664ccf8bab01590")
arch=("x86_64")
makedepends=("gendesk" "coreutils" "git" "python-virtualenv" "python-pip")
depends=("swig" "python-pyqt6" "bash")
provides=("$pkgname=$pkgver")

pkgver()
{
    cd "$pkgname-git" || exit
    git describe --tags --abbrev=0 | sed -r "s/^v//"
}

prepare()
{
    # pillow <= 9.5.0 does not work with pip, pillow > 9.5.0 does not work with PyQt5
    # use pillow > 9.5.0 together with PyQt6 instead of PyQt5
    echo "patching 'requirements.txt'"
    sed -i -e '/^pillow<=9\.5\.0$/c\pillow' -e '/^PyQt5$/c\PyQt6' "$pkgname-git/requirements.txt"
}

build()
{
    gendesk -f -n --categories="Utility" --startupnotify="true" --mimetypes="application/pdf"
    sed -i '/^Name=Simple-signer$/c\Name=Simple Signer' "$pkgname.desktop"
    echo "creating start script"
    echo -e '#!/bin/bash\ncd "/opt/'"$pkgname"'/bin"\n"./'"$pkgname"'" "$@"' > "start.sh"
    ln -fsv "/opt/$pkgname/start.sh" "$pkgname"
    cd "$pkgname-git" || exit
    echo "creating virtual environment"
    python -m venv --clear --system-site-packages venv
    echo "installing from 'requirements.txt'"
    venv/bin/pip install .
    echo "removing unnecessary packages from virtual environment"
    venv/bin/pip uninstall -y pip
    echo "making virtual environment portable"
    sed -i '1s|.*|#!/usr/bin/env -S /bin/sh -c '"'"'"\$(dirname "\$0")/python" "\$0" "\$@"'"'"'|' "venv/bin/$pkgname"
}

package()
{
    install -dv "$pkgdir"/{"opt/$pkgname","usr/bin"}
    cp -afv "$pkgname" "$pkgdir/usr/bin"
    cp -afv "$pkgname-git/venv/"* "$pkgdir/opt/$pkgname"
    install -Dvm755 "start.sh" "$pkgdir/opt/$pkgname/start.sh"
    install -Dvm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 "$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"
}
