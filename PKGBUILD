# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname='rutorrent-git'
pkgver=r2617.1f15836b
pkgrel=1
pkgdesc="Web frontend to rTorrent in PHP designed to resemble uTorrent"
url="https://github.com/Novik/ruTorrent"
license=('GPL')
arch=('any')

install=rutorrent.install
options=(!strip)

depends=('php' 'curl' 'mktorrent')
makedepends=('git')
optdepends=('php-geoip: enable geoip plugin'
            'geoip: enable geoip plugin'
            'unrar: enable unpack plugin'
            'unzip: enable unpack plugin'
            'plowshare: fileupload plugin functionality'
            'python-cfscrape: cloudflare plugin requirement')
 
conflicts=('rutorrent' 'rutorrent-plugins')
provides=('rutorrent' 'rutorrent-plugins')

_webdir="usr/share/webapps"
backup=("${_webdir}/rutorrent/conf/config.php"
        "${_webdir}/rutorrent/conf/access.ini"
        "${_webdir}/rutorrent/conf/plugins.ini")

_plugins=('extra/filemanager'
          'extra/fileshare'
          'extra/fileupload'
          'extra/mediastream'
          'titlebar'
          'ratiocolor'
          'mobile')

_themes=('MaterialDesign'
         'QuickBox'
         'FlatUI')

source=("plugins.ini"
        "https://raw.githubusercontent.com/weixiyen/jquery-filedrop/master/jquery.filedrop.js"
        "rutorrent::git+https://github.com/Novik/ruTorrent.git"
        "titlebar::git+https://github.com/SanKen/rutorrent-titlebar.git"
        "ratiocolor::git+https://github.com/senki/rutorrent-ratiocolor.git"
        "extra::git+https://github.com/nelu/rutorrent-thirdparty-plugins.git"
        "mobile::git+https://github.com/xombiemp/rutorrentMobile.git"
        "MaterialDesign::git+https://github.com/Phlooo/ruTorrent-MaterialDesign.git"
        "QuickBox::git+https://github.com/QuickBox/club-QuickBox.git"
        "git+https://github.com/exetico/FlatUI.git")

md5sums=('21b595d878e49dde91fca665a0a8effb'
         '3e0002fe9ce69f43513152c515944559'
         'SKIP'
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
        -e "s:\$tempDirectory .*:\$tempDirectory = '/${_webdir}/rutorrent/tmp/';:"

    for i in php stat curl id gzip; do
        sed -i conf/config.php \
            -e "s:\"$i\".*=> ''.*:\"$i\"   => \'/usr/bin/$i\',:"
    done

    for i in rar zip unzip unrar tar; do
        sed -i ../extra/filemanager/conf.php \
            -e "s:\$pathToExternals\['$i'\] = '':\$pathToExternals\['$i'\] = '/usr/bin/$i':"
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

    for i in ${_plugins[@]}; do
        rm -rf "$srcdir/$i/.git"
        cp -r  "$srcdir/$i" .
    done

    for i in ${_themes[@]}; do
        rm -rf "$srcdir/$i/.git"
        cp -r  "$srcdir/$i" ./theme/themes
    done

    cp -f  "$srcdir/jquery.filedrop.js" filedrop/jquery.filedrop.js

    install -dm755 "$pkgdir/$_webdir"

    cd "$pkgdir/$_webdir"

    cp -r "$srcdir/rutorrent" .
    rm -r rutorrent/{.git*,README*}

    cd rutorrent

    install -Dm755 "$srcdir/plugins.ini" conf/plugins.ini
    mkdir -p tmp
    cp share/.htaccess tmp/
}
