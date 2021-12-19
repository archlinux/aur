# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgbase=git-credential-manager-core
pkgname=("$pkgbase" "${pkgbase}-extras")
pkgver=2.0.605
pkgrel=1
pkgdesc="A secure Git credential helper built on .NET that runs on Windows, macOS, and Linux"
arch=(i686 x86_64)
url="https://github.com/microsoft/Git-Credential-Manager-Core"
license=('MIT')
makedepends=(git dotnet-sdk dotnet-runtime dpkg)
checkdepends=(dotnet-runtime-5.0)
provides=($pkgname)
conflicts=("${pkgname}-bin")
replaces=(git-credential-manager)
options=(!strip)
install=$pkgname.install
source=("$pkgbase::git+$url.git#tag=v$pkgver"
        "trim-executables.diff")
sha256sums=('SKIP'
            '3eb41718ef9c701307a6ca7ef85b6993d93fe55b5ad4fad632ff5722779397cf')

prepare() {
    cd "$pkgbase"
    # Based on this chinese article:
    # https://live4thee.github.io/posts/2021-02-09-dotnet-core-on-linux-2/
    # Thanks web translators :P
    git apply ../trim-executables.diff
}

build() {
    cd "$pkgbase"
    dotnet build --configuration=LinuxRelease
}

check() {
    cd "$pkgbase"
    dotnet test --configuration LinuxRelease
}

package_git-credential-manager-core() {
    depends+=(zlib krb5)
    optdepends=('git-credential-manager-core-extras: additional QT UIs for logging in')

    cd "$pkgbase"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/share/$pkgname"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    
    for bin in git-credential-manager-core
    do
        cp "out/linux/Packaging.Linux/payload/Release/$bin" "$pkgdir/usr/lib/share/$pkgname"
        ln -s "/usr/lib/share/$pkgname/$bin" "$pkgdir/usr/bin/$bin"
    done

    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

package_git-credential-manager-core-extras() {
    pkgdesc="Additional login UIs to Github and Bitbucket for Git Credential Manager Core"
    depends+=(zlib krb5 fontconfig)

    cd "$pkgbase"

    mkdir -p "$pkgdir/usr/lib/share/$pkgbase"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

    for lib in libHarfBuzzSharp.so libSkiaSharp.so
    do
        cp "out/linux/Packaging.Linux/payload/Release/$lib" "$pkgdir/usr/lib/share/$pkgbase"
    done

    for bin in GitHub.UI Atlassian.Bitbucket.UI
    do
        cp "out/linux/Packaging.Linux/payload/Release/$bin" "$pkgdir/usr/lib/share/$pkgbase"
    done

    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
