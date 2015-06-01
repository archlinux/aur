# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=('rutorrent-git')
pkgver=r1464.961d9bd
pkgrel=1
epoch=1
pkgdesc="Web frontend to rTorrent in PHP designed to resemble uTorrent"
url="https://github.com/Novik/ruTorrent"
license=('GPL')
arch=('any')

install=rutorrent.install
options=(!strip)

depends=('php' 'curl')
makedepends=('git' 'subversion')
optdepends=('mktorrent: create torrent files with mktorrent'
            'buildtorrent: create torrent files with buildtorrent'
            'transmission-cli: create torrent files with transmission'
            'php-geoip: enable geoip plugin'
            'geoip: enable geoip plugin'
            'unrar: enable unpack plugin'
            'unzip: enable unpack plugin')

conflicts=('rutorrent' 'rutorrent-plugins')
provides=('rutorrent' 'rutorrent-plugins')

_webdir="usr/share/webapps"
backup=("${_webdir}/rutorrent/conf/config.php"
        "${_webdir}/rutorrent/conf/access.ini"
        "${_webdir}/rutorrent/conf/plugins.ini")

_plugins=('chat' 'filemanager' 'fileshare' 'fileupload' 'mediastream' 'titlebar')

source=("plugins.ini"
        "https://raw.githubusercontent.com/weixiyen/jquery-filedrop/master/jquery.filedrop.js"
        "rutorrent::git+https://github.com/Novik/ruTorrent.git"
        "titlebar::git+https://github.com/SanKen/rutorrent-titlebar.git"
        "filemanager::svn+http://svn.rutorrent.org/svn/filemanager/trunk/filemanager"
        "fileshare::svn+http://svn.rutorrent.org/svn/filemanager/trunk/fileshare"
        "fileupload::svn+http://svn.rutorrent.org/svn/filemanager/trunk/fileupload"
        "mediastream::svn+http://svn.rutorrent.org/svn/filemanager/trunk/mediastream"
        "chat::svn+https://rutorrent-chat.googlecode.com/svn/trunk")

md5sums=('a3efa833b362ac7f3ff69ddaa720de81'
         '020b0c3fc1220d490992473a75485add'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/rutorrent"

    _gitrev=$(git rev-parse --short HEAD)
    _gitcount=$(git rev-list --count HEAD)
    echo "r${_gitcount}.${_gitrev}"
}

prepare() {
    cd "$srcdir/rutorrent"

    sed -i conf/config.php \
        -e "s:\$topDirectory .*:\$topDirectory = '/home';:" \
        -e "s:\$XMLRPCMountPoint .*:\$XMLRPCMountPoint = \"/rutorrent/RPC1\";:" \
        -e "s:\$tempDirectory .*:\$tempDirectory = '/${_webdir}/rutorrent/tmp';:"
    sed -i php/settings.php \
        -e "s:'/tmp:'/${_webdir}/rutorrent/tmp/:"

    _gitrev=$(git rev-parse --short HEAD)
    _gitdate=$(git log -1 --format="%cd" --date=short)
    _gitcount=$(git rev-list --count HEAD)

    sed -i js/webui.js \
        -e "s|version: \"3.*|version: \"3.x-git~${_gitrev} r${_gitcount} ${_gitdate}\",|"
}

package() {
    cd "$srcdir/rutorrent/plugins"

    for i in ${_plugins[@]}; do
        cp -r "$srcdir/$i" .
    done
    cp -f "$srcdir/jquery.filedrop.js" filedrop/jquery.filedrop.js

    install -dm755 "$pkgdir/$_webdir"
    cd "$pkgdir/$_webdir"

    cp -r "$srcdir/rutorrent" .
    rm -r rutorrent/{.git*,README*}

    install -Dm755 "$srcdir/plugins.ini" rutorrent/conf/plugins.ini
    mkdir -p rutorrent/tmp
}
