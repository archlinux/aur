# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="simple-signer-git"
pkgver="1.5.5.r13.de2609e"
pkgrel="2"
pkgdesc="Sign PDF files using a simple GUI."
url="https://github.com/schorschii/Simple-Signer"
license=("GPL-3.0-only")
source=("$pkgname::git+$url.git" "${pkgname%-git}.png")
b2sums=("SKIP" "975874462b04d04c4cb8e7305e410fc3f8df1ca17f5507a0f5faf373444960e8d0a124c0ffa0493872fed6bcace6faad26df3bd54bcea2879664ccf8bab01590")
arch=("x86_64")
makedepends=("gendesk" "coreutils" "git" "python-virtualenv" "python-pip")
depends=("swig" "python-pyqt6" "bash")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=$pkgver")

pkgver()
{
    cd "$pkgname" || exit
    git describe --long --tags | sed -r "s/^v//; s/-([0-9]+)-/.r\1./; s/\.g/./"
}

build()
{
    gendesk -f -n --categories="Utility" --startupnotify="true" --mimetypes="application/pdf"
    sed -i '/^Name=Simple-signer$/c\Name=Simple Signer' "${pkgname%-git}.desktop"
    echo "creating start script"
    echo -e '#!/bin/bash\ncd "/opt/'"${pkgname%-git}"'/bin"\n"./'"${pkgname%-git}"'" "$@"' > "${pkgname%-git}"
    cd "$pkgname" || exit
    echo "creating virtual environment"
    python -m venv --clear --system-site-packages venv
    echo "installing from 'requirements.txt'"
    venv/bin/pip install --isolated .
    echo "removing unnecessary packages from virtual environment"
    venv/bin/pip uninstall --isolated -y pip
    echo "making virtual environment portable"
    sed -i '1s|.*|#!/usr/bin/env -S /bin/sh -c '"'"'"\$(dirname "\$0")/python" "\$0" "\$@"'"'"'|' "venv/bin/${pkgname%-git}"
}

package()
{
    install -dv "$pkgdir/opt/${pkgname%-git}"
    cp -afv "$pkgname/venv/"* "$pkgdir/opt/${pkgname%-git}"
    install -Dvm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dvm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dvm644 "${pkgname%-git}.png" "$pkgdir/usr/share/icons/${pkgname%-git}.png"
}
