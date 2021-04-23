# Maintainer: Saurabh Kumar Sharma <imesskayesss at gmail dot com>
pkgname=phoenixminer
pkgver=1.0
pkgrel=2
pkgdesc="Unofficial installer for PhoenixMiner"
arch=("x86_64")
url="https://github.com/PhoenixMinerDevTeam/PhoenixMiner/"
license=("GPL")
depends=("curl" "tar" ) 
options=('!strip')

source=("phoenix-miner")
sha256sums=('cf84dba93c9164fa364b31720040eee9a5223f97d4952610d0cd785439896df5')

prepare(){
    # Getting latest package version
    latver=$(curl --silent 'https://api.github.com/repos/PhoenixMinerDevTeam/PhoenixMiner/releases/latest' | grep ".*tag_name.*" | sed -E 's/.*"([^"]+)".*/\1/')
    mkdir -p phoenixminer
    downloadlink=$(curl --silent 'https://api.github.com/repos/PhoenixMinerDevTeam/PhoenixMiner/releases/latest' | grep ".*browser_download_url.*Linux.*" | sed -E 's/.*"([^"]+)".*/\1/')
    echo "Downloading phoenixminer v$latver"
    echo "    using link: $downloadlink" 
    curl -L "$downloadlink" | tar xzf - --directory "phoenixminer" --strip-components=1
    chmod 755 phoenixminer/*
    chmod 766 phoenixminer/config.txt
    chmod +x ${srcdir}/phoenix-miner
}

package(){
    install -dm755 "${pkgdir}/"{opt,usr/bin/}
    cp -rfL "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
    cp -rfL "${srcdir}/phoenix-miner" "${pkgdir}/usr/bin/phoenixminer"
    ln -sf "/opt/${pkgname}/config.txt" "${HOME}/.config/phoenixminer.cfg"
}
