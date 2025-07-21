# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=technitium-dns-server-git
_pkgname=technitium-dns-server
pkgver=r3436.g767f764f
pkgrel=1
pkgdesc="Open source authoritative and recursive DNS server focused on privacy and security"
arch=('x86_64')
url="https://technitium.com/dns/"
license=('GPL-3.0-only')
depends=('aspnet-runtime-9.0' 'glibc' 'gcc-libs')
conflicts=('technitium-dns-server')
provides=('technitium-dns-server')
source=("TechnitiumLibrary::git+https://github.com/TechnitiumSoftware/TechnitiumLibrary.git"
        "DnsServer::git+https://github.com/TechnitiumSoftware/DnsServer.git"
        "technitium-dns-server.dinit"
        "technitium-dns-server.service"
        "technitium-dns-server.sysuser"
       )
sha256sums=('SKIP'
            'SKIP'
            '7562b6cd4fed82adf2b1e568a64914158938851448d29a8795aa163a77949286'
            '464dbfe1038e4737ca83c60617a5a4e334cdd948fe41315a3a36913011680952'
            'd349d144faf8932c56a054b22721420f1eb68adf7bc226f174654b33510f75e4')
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Do not remove empty directories from package
)
install=${_pkgname}.install

pkgver() {
	cd "${srcdir}/DnsServer"
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "TechnitiumLibrary" 
    echo "::: Setting target .NET version to 9.0"
    for pp in $(grep -Rl "<TargetFramework>net8.0</TargetFramework>")
    do
        sed -i 's/<TargetFramework>net8.0<\/TargetFramework>/<TargetFramework>net9.0<\/TargetFramework>/g' "${pp}"
    done
    
    echo "::: Building TechnitiumLibrary binaries"
    LDFLAGS+=' -Wl,-z,cet-report=error'
    
    # dotnet dev-certs https --trust
    
    dotnet build TechnitiumLibrary.ByteTree/TechnitiumLibrary.ByteTree.csproj -c Release
    dotnet build TechnitiumLibrary.Net/TechnitiumLibrary.Net.csproj -c Release
    
    cd "../DnsServer" 
    
    echo "::: Setting target .NET version to 9.0"
    for pp in $(grep -Rl "<TargetFramework>net8.0</TargetFramework>")
    do
        sed -i 's/<TargetFramework>net8.0<\/TargetFramework>/<TargetFramework>net9.0<\/TargetFramework>/g' "${pp}"
    done
    
    echo "::: Building DnsServer binaries"
    dotnet publish DnsServerApp/DnsServerApp.csproj -c Release
}

package() {
#	cd "DnsServer/DnsServerApp/bin/Release/publish" 
    echo "::: Installing binaries"
    install -Dm755 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerApp" "${pkgdir}/opt/${_pkgname}/DnsServerApp"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerApp.deps.json" "${pkgdir}/opt/${_pkgname}/DnsServerApp.deps.json"
    install -Dm755 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerApp.dll" "${pkgdir}/opt/${_pkgname}/DnsServerApp.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerApp.pdb" "${pkgdir}/opt/${_pkgname}/DnsServerApp.pdb"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerApp.runtimeconfig.json" "${pkgdir}/opt/${_pkgname}/DnsServerApp.runtimeconfig.json"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerCore.ApplicationCommon.dll" "${pkgdir}/opt/${_pkgname}/DnsServerCore.ApplicationCommon.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerCore.ApplicationCommon.pdb" "${pkgdir}/opt/${_pkgname}/DnsServerCore.ApplicationCommon.pdb"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerCore.dll" "${pkgdir}/opt/${_pkgname}/DnsServerCore.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/DnsServerCore.pdb" "${pkgdir}/opt/${_pkgname}/DnsServerCore.pdb"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/named.root" "${pkgdir}/opt/${_pkgname}/named.root"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/root-anchors.xml" "${pkgdir}/opt/${_pkgname}/root-anchors.xml"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.ByteTree.dll" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.ByteTree.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.ByteTree.pdb" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.ByteTree.pdb"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.dll" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.IO.dll" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.IO.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.IO.pdb" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.IO.pdb"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.Net.dll" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.Net.dll"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.Net.pdb" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.Net.pdb"
    install -Dm644 "DnsServer/DnsServerApp/bin/Release/publish/TechnitiumLibrary.pdb" "${pkgdir}/opt/${_pkgname}/TechnitiumLibrary.pdb"
    cp -a "DnsServer/DnsServerApp/bin/Release/publish/www" "${pkgdir}/opt/${_pkgname}/www"
    echo "::: Creating config directory"
    mkdir -p "${pkgdir}/opt/${_pkgname}/config"
    touch "${pkgdir}/opt/${_pkgname}/config/.config_files_are_here"
    
    install -Dm644 "technitium-dns-server.dinit" "${pkgdir}/opt/${_pkgname}/service/technitium-dns-server.dinit"
    install -Dm644 "technitium-dns-server.service" "${pkgdir}/opt/${_pkgname}/service/technitium-dns-server.service"
    install -Dm644 "technitium-dns-server.sysuser" "${pkgdir}/opt/${_pkgname}/service/technitium-dns-server.sysuser"
}
