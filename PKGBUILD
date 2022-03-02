# Maintainer: DanielNak <daniel@tee.cat>
# Contributor: Max Zhao < alcasa dot mz at gmail dot com >
# Contributor: Konstantin Gizdov < arch at kge dot pw >

_author=jart
_pkgname=hiptext
pkgname=hiptext-gif
pkgver=0.2
pkgrel=2
pkgdesc='Command line tool for rendering images and videos inside terminals (w/ gif patch).'
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('GPL')
depends=('gflags'
         'google-glog')
makedepends=('ffmpeg'
             'freetype2'
             'giflib'
             'libjpeg-turbo'
             'libpng12'
             'ragel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/$_author/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        'hiptext.sh'
        'freetype_config.patch'
        'build_with_latest_ffmpeg.patch'
        'video_flicker.patch'
        'add_gif_extension.patch')
sha256sums=('7f2217dec8775b445be6745f7bd439c24ce99c4316a9faf657bee7b42bc72e8f'
            'f25b95246f54d11489046a7278b549de48704a8d1b19235e07786c55998dc6a6'
            '9d3e5801a92ddd4bd278f3d515cf16d7d969f2c319bb05559ccf5299c37fbebe'
            '59482f694811569d08596c07c2461ad9adb6c74c500b6a8755889a78eb27f4b1'
            'c9ddd3e4266a4f6fd0b92bf1c23d7bb5bf6ec150dfa67c76b5f17df6a92a3d49'
            '7f0ac14122bcf0c22c0ca2859f54746c95663782b2d1a2a47cfd477a72841ae4')

prepare() {
    cd "$_pkgname-$pkgver"
    msg2 'Applying patches...'
    patch -p1 -i "$srcdir/build_with_latest_ffmpeg.patch"
    patch -p1 -i "$srcdir/video_flicker.patch"
    patch -p1 -i "$srcdir/freetype_config.patch"
    patch -p1 -i "$srcdir/add_gif_extension.patch"
    msg2 'Running Autogen... '
    ./autogen.sh
    msg2 'Configuring...'
     ./configure --prefix=/usr             \
                 --includedir=/usr/include \
                 --libdir=/usr/lib         \
                 --datarootdir=/usr/share  \
                 --sysconfdir=/etc         \
                 --localstatedir=/var      \
                 --sharedstatedir=/com
}

build() {
    cd "$_pkgname-$pkgver"
    msg2 'Building...'
    make
}

package() {
    cd "$_pkgname-$pkgver"
    msg2 'Installing...'
    make DESTDIR="$pkgdir/usr/share/$pkgname" install
    install -d "$pkgdir/usr/share/$pkgname/fonts"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/DejaVuSansMono.ttf" \
                   "$pkgdir/usr/share/$pkgname/fonts/DejaVuSansMono.ttf"
    install -Dm755 "$srcdir/hiptext.sh" "$pkgdir/usr/bin/hiptext"
}
