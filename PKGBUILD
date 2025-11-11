# Maintainer: Vamp898 <vamp898-aur@ikaros.space>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: ny-a <nyaarch64 at gmail dot com>
# Contributor: Daniel Moch <daniel@danielmoch.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

pkgname=mastodon
pkgver=4.5.0
pkgrel=1
pkgdesc='Your self-hosted, globally interconnected microblogging community'
arch=(any)
url=https://github.com/mastodon/mastodon
license=(AGPL3)
depends=(corepack
	 ffmpeg
         git
         libidn
         libpqxx
         libvips
         libxml2
         libxslt
         libyaml
         nodejs
         postgresql
         protobuf
         ruby-bundler
         sudo
         valkey
         zlib
         yarn-berry)
backup=(etc/mastodon.conf)
install=mastodon.install
options=(!strip)
source=(https://github.com/mastodon/mastodon/archive/v$pkgver.tar.gz
        mastodon.target
        mastodon.sysusers.d
        mastodon.tmpfiles.d
        devise_pam.patch)
sha256sums=('86d3daa5e402d0cbc702cfda4d1c9e5043f8d7df2ade1be11b1e8054c6f36340'
            'e9928ced31f6490476100f02f2e158e41a076988dd7f3dff8f21d245bc2bb0ff'
            '1b67693f7de5802a34985b9ac969497fc6e6042dcae0b8abf6595b9fe15ee80e'
            '3fdd54dd1f374b7206c8beaebafdf890e74d30385f0c93f9cd99e1e4be92f8fa'
            '8415cded8d5f159623439b8ab0a87c1ac653a32f6945eebc9140195289c1ece6')
prepare() {
	cd mastodon-$pkgver
	patch -p1 < ../devise_pam.patch
}

build() {
	export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
	cd mastodon-$pkgver
	sed -i '/husky install/d' package.json # Stop husky from hijacking git hooks
	bundle config set deployment true
	bundle config without 'development test'
	bundle config with 'pam_authentication'
	# Disable LTO which breaks the C extension of the google-protobuf gem https://github.com/protocolbuffers/protobuf/issues/11935
	bundle config --local build.google-protobuf "-- --with-cflags='$(ruby -r rbconfig -e 'print RbConfig::CONFIG["CFLAGS"]' | sed -e 's/-Werror=format-security//' -e 's/-flto=auto/-fno-lto/')' --with-ldflags='$(ruby -r rbconfig -e 'print RbConfig::CONFIG["LDFLAGS"]' | sed -e 's/-flto=auto/-fno-lto/')'"
	bundle config set frozen false
	bundle add erb
	BUNDLE_BUILD__CHARLOCK_HOLMES="--with-cxxflags=-std=c++17" bundle install -j$(getconf _NPROCESSORS_ONLN)
	corepack enable --install-directory . yarn
	./yarn install --immutable
	# https://aur.archlinux.org/packages/mastodon?O=0#comment-986425
	cd vendor/bundle/ruby/*/gems/ox-*/ext/ox
	make
	cp ox.so ../../lib
}

package() {
	install -d "$pkgdir"/{var/lib,etc}
	cp -a mastodon-$pkgver "$pkgdir"/var/lib/mastodon

	 # Put the config file in /etc and link to it
	touch "$pkgdir"/etc/mastodon.conf
	ln -s /etc/mastodon.conf "$pkgdir"/var/lib/mastodon/.env.production
	ln -s /usr/bin/node "$pkgdir"/var/lib/mastodon/node

	install -Dm 644 mastodon.target -t "$pkgdir"/usr/lib/systemd/system
	install -Dm 644 mastodon.sysusers.d "$pkgdir"/usr/lib/sysusers.d/mastodon.conf
	install -Dm 644 mastodon.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/mastodon.conf

	cd mastodon-$pkgver/dist

	# Fix path discrepancies
	sed -e 's/home\/mastodon\/live/var\/lib\/mastodon/g' -e 's/home\/mastodon\/.rbenv\/shims/usr\/bin/' -i mastodon-*.service
	sed -e 's/home\/mastodon\/live/var\/lib\/mastodon/g' -i nginx.conf

	install -Dm 644 mastodon-*.service -t "$pkgdir"/usr/lib/systemd/system
}
