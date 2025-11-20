# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname='rutorrent-git'
pkgver=5.2.10.r0.ge8391918
pkgrel=1
pkgdesc="Web frontend to rTorrent in PHP designed to resemble uTorrent"
url="https://github.com/Novik/ruTorrent"
license=('GPL')
arch=('any')

install=rutorrent.install
options=(!strip)

depends=('php' 'curl' 'mktorrent')
makedepends=('git')
optdepends=('ffmpeg: enable screenshots plugin'
            'sox: enable spectrogram plugin'
            'mediainfo: enable mediainfo plugin'
            'php-geoip: enable geoip plugin'
            'unrar: enable unpack plugin'
            'unzip: enable unpack plugin'
            'python-cloudscraper: cloudflare plugin requirement')
 
conflicts=('rutorrent' 'rutorrent-plugins')
provides=('rutorrent' 'rutorrent-plugins')

_webdir="usr/share/webapps"
backup=("${_webdir}/rutorrent/conf/config.php"
        "${_webdir}/rutorrent/conf/access.ini"
        "${_webdir}/rutorrent/conf/plugins.ini")

source=("rutorrent::git+https://github.com/Novik/ruTorrent.git")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rutorrent"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/rutorrent"

    sed -i conf/config.php \
        -e "s:\$topDirectory .*:\$topDirectory = '/home';:" \
        -e "s:\$XMLRPCMountPoint .*:\$XMLRPCMountPoint = \"/rutorrent/RPC1\";:" \
        -e "s:\$tempDirectory .*:\$tempDirectory = '/${_webdir}/rutorrent/tmp/';:"

    for i in php stat curl id gzip; do
        sed -i conf/config.php \
            -e "s:\"$i\".*=> ''.*:\"$i\"   => \'/usr/bin/$i\',:"
    done

    for i in rar zip unzip unrar tar; do
        sed -i plugins/unpack/conf.php \
            -e "s:\$pathToExternals\['$i'\] = '':\$pathToExternals\['$i'\] = '/usr/bin/$i':"
    done

    sed -i plugins/create/conf.php \
        -e "s:\$useExternal = false:\$useExternal = true:" \
        -e "s:\$pathToCreatetorrent = '':\$pathToCreatetorrent = '/usr/bin/$i':"

    sed -i php/settings.php \
        -e "s:'/tmp:'/${_webdir}/rutorrent/tmp/:"

    _gitrev=$(git rev-parse --short HEAD)
    _gitdate=$(git log -1 --format="%cd" --date=short)
    _gitcount=$(git rev-list --count HEAD)

    sed -i js/webui.js \
        -e "s|version: \"3.*|version: \"3.x-git~${_gitrev} r${_gitcount} ${_gitdate}\",|"
}

package() {
    export LC_ALL=$LANG
    cd "$srcdir/rutorrent/plugins"

    install -dm755 "$pkgdir/$_webdir"

    cd "$pkgdir/$_webdir"

    cp -r "$srcdir/rutorrent" .
    rm -r rutorrent/{.git*,README*}

    cd rutorrent

    mkdir -p tmp
    cp share/.htaccess tmp/
}
