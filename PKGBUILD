# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Pablo Olmos de Aguilera C. pablo+aur at odac dot co
# Contributor: Kim Silkebækken <kim.silkebaekken+aur@gmail.com>

pkgbase=python-powerline-git
pkgname=('python2-powerline-git' 'python-powerline-git')
pkgdesc='The ultimate statusline/prompt utility'
pkgver=2.7+3+gd7a93938
pkgrel=1
epoch=1
url='https://github.com/powerline/powerline'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'python2-setuptools' 'python-setuptools' 'python2-sphinx')
install='powerline.install'
source=('powerline::git+https://github.com/powerline/powerline.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
	cd powerline
	local base_version=$(sed -n "s/\s*base_version\s*=\s*['\"]\(.*\)['\"]\s*/\1/p" setup.py)
	local count=+$(git rev-list --count $(git blame setup.py | grep "\s*base_version\s*=.*$base_version" | cut -d\  -f1)..HEAD)
	local rev=$(git rev-parse --short HEAD)
	printf '%s%s+g%s' "$base_version" "${count/+0/}" "$rev"
}

build() {
	cd powerline/docs
	make man SPHINXBUILD=sphinx-build2
}

package_generic() {
	# Fonts
	install -dm755 "$pkgdir/etc/fonts/conf.d"
	install -Dm644 "font/PowerlineSymbols.otf" "$pkgdir/usr/share/fonts/OTF/PowerlineSymbols.otf"
	install -Dm644 "font/10-powerline-symbols.conf" "$pkgdir/etc/fonts/conf.avail/10-powerline-symbols.conf"
	ln -s "../conf.avail/10-powerline-symbols.conf" "$pkgdir/etc/fonts/conf.d/10-powerline-symbols.conf"

	# Vim Plugin
	install -Dm644 "powerline/bindings/vim/plugin/powerline.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/powerline.vim"

	# Zsh Plugin
	install -Dm644 "powerline/bindings/zsh/powerline.zsh" "$pkgdir/usr/share/zsh/site-contrib/powerline.zsh"

	# Fish Plugin
	install -Dm644 "powerline/bindings/fish/powerline-setup.fish" "$pkgdir/usr/share/fish/vendor_functions.d/powerline-setup.fish"

	# Bash Plugin
	install -Dm644 "powerline/bindings/bash/powerline.sh" "$pkgdir/usr/share/bash/powerline.sh"

	# Rcsh Plugin
	install -Dm644 "powerline/bindings/rc/powerline.rc" "$pkgdir/usr/share/rc/powerline.rc"

	# Other Shells Plugin
	install -Dm644 "powerline/bindings/shell/powerline.sh" "$pkgdir/usr/share/shell/powerline.sh"

	# Tmux Configuration
	install -Dm644 "powerline/bindings/tmux/powerline.conf" "$pkgdir/usr/share/tmux/powerline.conf"

	# Systemd Service
	install -Dm644 "powerline/dist/systemd/powerline-daemon.service" "$pkgdir/usr/lib/systemd/user/powerline-daemon.service"

	# License
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Manpages
	install -dm755 "$pkgdir/usr/share/man/man1/"
	install -Dm644 "docs/_build/man/"* "$pkgdir/usr/share/man/man1/"
}

package_python2-powerline-git() {
	depends=('python2>=2.6')
	optdepends=('python2-psutil: improved system information'
	            'python2-pygit2: improved git support'
	            'python2-hglib: improved mercurial support'
	            'zsh: better shell prompt'
	            'vim: vim compiled with Python support')
	conflicts=('powerline2' 'powerline'
	           'python-powerline-git'
	           'otf-powerline-symbols-git')

	cd powerline
	python2 setup.py install --root="$pkgdir" --optimize=1

	package_generic
}

package_python-powerline-git() {
	depends=('python>=3.2')
	optdepends=('python-psutil: improved system information'
	            'python-pygit2: improved git support'
	            'python-hglib: improved mercurial support'
	            'zsh: better shell prompt'
	            'vim: vim compiled with Python support')
	conflicts=('powerline2' 'powerline'
	           'python2-powerline-git'
	           'otf-powerline-symbols-git')

	cd powerline
	python setup.py install --root="$pkgdir" --optimize=1

	package_generic
}

# vim: sw=4 noet
