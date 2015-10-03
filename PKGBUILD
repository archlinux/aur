pkgname=youtube-dl-git
pkgver=2015.09.28.r38.gbad8475
pkgrel=1

pkgdesc='A small command-line program to download videos from YouTube.com and a few more sites'
url="http://rg3.github.io/youtube-dl"
arch=('any')
license=('custom')

depends=('python' 'python-setuptools')
makedepends=('git')

optdepends=('ffmpeg: for video post-processing')

provides=('youtube-dl')
conflicts=('youtube-dl')

source=('git://github.com/rg3/youtube-dl.git')

md5sums=('SKIP')

pkgver() {
	cd youtube-dl
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd youtube-dl
	sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
        sed -i ':etc/fish/completions:d' setup.py
}

package() {
	cd youtube-dl

	python devscripts/bash-completion.py
	python setup.py install --root="$pkgdir" --optimize=1

	mv "$pkgdir"/usr/share/bash-completion/completions/youtube-dl.bash-completion \
	   "$pkgdir"/usr/share/bash-completion/completions/youtube-dl
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
