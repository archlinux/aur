# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=docker-openrc-git
pkgver=1.12.0.dev.25566.656c66d
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container.'
arch=('i686' 'x86_64')
url="https://github.com/docker/docker"
license=('Apache License Version 2.0')
options=('!strip')
source=(git+git://github.com/docker/docker
        'docker.install')
md5sums=('SKIP'
         'ab06126a6b29bee1dbfb4162c624b743')
install='docker.install'
depends=('openrc' 'runc-git' 'containerd-git' 'bridge-utils' 'iproute2' 'device-mapper' 'sqlite')
makedepends=('git' 'go' 'btrfs-progs' 'go-md2man')
backup=('etc/conf.d/docker')
provides=('docker')
conflicts=('docker' 'docker-git')
replaces=('docker')

pkgver() {
	cd "${srcdir}/docker"
	_dockerver="$(cat VERSION)"
	printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd docker
}

build() {
	cd docker
	export AUTO_GOPATH=1
	./hack/make.sh dynbinary
	for i in man/*.md; do
		go-md2man -in "$i" -out "${i%.md}"
	done
}

package() {
	cd docker
	_dockerver="$(cat VERSION)"
	install -Dm755 "bundles/$_dockerver/dynbinary-client/docker-$_dockerver" "$pkgdir/usr/bin/docker"
	install -Dm755 "bundles/$_dockerver/dynbinary-daemon/dockerd-$_dockerver" "$pkgdir/usr/bin/dockerd"

	# symlink containerd/run (nice integration...)
	ln -s containerd "$pkgdir/usr/bin/docker-containerd"
	ln -s containerd-shim "$pkgdir/usr/bin/docker-containerd-shim"
	ln -s ctr "$pkgdir/usr/bin/docker-containerd-ctr"
	ln -s runc "$pkgdir/usr/bin/docker-runc"

	# completion
	install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
	install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"

	# OpenRC
	install -Dm755 "contrib/init/openrc/docker.confd" "$pkgdir/etc/conf.d/docker"
	install -Dm755 "contrib/init/openrc/docker.initd" "$pkgdir/etc/init.d/docker"

	# Fix to work with openrc on arch linux
	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
	-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
	-e 's|/var/run|/run|g' \
	-i ${pkgdir}/etc/init.d/docker

	cd man
	for section in 1 5; do
		for i in *.$section; do
			install -Dm644 "$i" "$pkgdir/usr/share/man/man$section/$i"
		done
	done
}
