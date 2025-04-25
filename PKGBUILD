# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="simple-signer"
pkgver="1.7.0"
pkgrel="1"
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

build()
{
    gendesk -f -n --categories="Utility" --startupnotify="true" --mimetypes="application/pdf"
    sed -i '/^Name=Simple-signer$/c\Name=Simple Signer' "$pkgname.desktop"
    echo "creating start script"
    echo -e '#!/bin/bash\ncd "/opt/'"$pkgname"'/bin"\n"./'"$pkgname"'" "$@"' > "$pkgname"
    cd "$pkgname-git" || exit
    echo "creating virtual environment"
    python -m venv --clear --system-site-packages venv
    echo "installing from 'requirements.txt'"
    venv/bin/pip install --isolated .
    echo "removing unnecessary packages from virtual environment"
    venv/bin/pip uninstall --isolated -y pip
    echo "making virtual environment portable"
    sed -i '1s|.*|#!/usr/bin/env -S /bin/sh -c '"'"'"\$(dirname "\$0")/python" "\$0" "\$@"'"'"'|' "venv/bin/$pkgname"
}

package()
{
    install -dv "$pkgdir/opt/$pkgname"
    cp -afv "$pkgname-git/venv/"* "$pkgdir/opt/$pkgname"
    install -Dvm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dvm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 "$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"
}
