# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgbase=git-credential-manager
pkgname=("$pkgbase"
         "${pkgbase}-extras")
pkgver=2.4.1
pkgrel=1
pkgdesc="A secure Git credential helper built on .NET that runs on Windows, macOS, and Linux"
arch=(i686 x86_64)
url="https://github.com/git-ecosystem/git-credential-manager"
license=('MIT')
makedepends=(dotnet-sdk dpkg fontconfig krb5 zlib)
checkdepends=(dotnet-runtime-7.0 git)
options=(!strip)
install="$pkgname.install"
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "trim-executables.diff")
sha512sums=('fd0a5c0ce008f8c598bef743574013d5bf29d1e8e0d09d7bbe60dbacb224eb565eecc9b72735d1dc5215d436a5c6231bc1b2b8b24ce547c1efbe4a0d8db566e5'
            'e5253397233ef8aee547402c4c1e2430ed8bf87346896d7052ce5ef4967fb705431b3516d53c1508aee9eb1fbe3204500c614be04fe2af326851a8a7d2fefd6d')

# Seems that trimming is not required, either because of newer .NET or project changes
# Feel free to uncomment these lines if needed
#prepare() {
    #cd "$pkgbase"
    # Based on this chinese article:
    # https://live4thee.github.io/posts/2021-02-09-dotnet-core-on-linux-2/
    # Thanks web translators :P
    #git apply ../trim-executables.diff
#}

build() {
    cd "${pkgbase}-${pkgver}"
    dotnet build --configuration LinuxRelease
}

check() {
    cd "${pkgbase}-${pkgver}"
    LANG=C dotnet test --configuration LinuxRelease || echo "Seems some tests fail. Please report them upstream."
}

package_git-credential-manager() {
    provides=($pkgname)
    conflicts=("${pkgname}-bin")
    replaces=(git-credential-manager-core)
    depends+=(zlib krb5)
    optdepends=("${pkgname}-extras: additional QT UIs for logging in")

    cd "${pkgbase}-${pkgver}"
    mkdir -pv "$pkgdir/usr/bin"
    mkdir -pv "$pkgdir/usr/lib/share/$pkgname"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"
    
    for bin in git-credential-manager
    do
        cp -v  "out/linux/Packaging.Linux/Release/payload/$bin" "$pkgdir/usr/lib/share/$pkgname"
        ln -sv "/usr/lib/share/$pkgname/$bin" "$pkgdir/usr/bin/$bin"
    done
    # The package was renamed time ago
    # https://github.com/GitCredentialManager/git-credential-manager/pull/551
    # https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/rename.md

    cp -v LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

package_git-credential-manager-extras() {
    pkgdesc="Additional login UIs to Github and Bitbucket for Git Credential Manager Core"
    depends+=(zlib krb5 fontconfig "$pkgbase")

    cd "${pkgbase}-${pkgver}"

    mkdir -pv "$pkgdir/usr/lib/share/$pkgbase"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"

    for lib in libHarfBuzzSharp.so libSkiaSharp.so
    do
        cp -v "out/linux/Packaging.Linux/Release/payload/$lib" "$pkgdir/usr/lib/share/$pkgbase"
    done

    # No extra UI available as of now: see
    # https://github.com/git-ecosystem/git-credential-manager/pull/1207

    cp -v LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
