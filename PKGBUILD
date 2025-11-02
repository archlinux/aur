pkgname=webone
pkgver=0.18.0
pkgrel=1
pkgdesc='HTTP 1.x proxy that makes old web browsers usable again in the Web 2.0 world'
url='https://github.com/atauenis/webone'
depends=(dotnet-runtime-8.0 imagemagick)
# Files are 100% identical between the .deb and the .rpm
arch=(x86_64)
source=(webone.sysusers
        webone.tmpfiles)
source_x86_64=("https://github.com/atauenis/webone/releases/download/v$pkgver/webone.$pkgver.linux-amd64.rpm")
sha256sums=('1eccc0c99a8c19519299c817766584d4d0f8f889b5d9f9ef60b6f7fb4afd9435'
            '84afa16b03edf86ef4d0c3234b7a64af1f8bd4e82d5027bf622656571a73f679')
sha256sums_x86_64=('50d06d05a56200580ed8b5284695396488bb969736a60facf710a04b9ed5d133')
# Stripping destroys the 'fat' single-file application bundle
options=(!strip)
backup=(etc/webone.conf
	etc/webone.conf.d/{codepage,escargot}.conf
	etc/webone.conf.d/openssl_webone.cnf
	etc/logrotate.d/webone)

package() {
	cp -av "$srcdir"/etc/. "$pkgdir"/etc
	cp -av "$srcdir"/usr/. "$pkgdir"/usr

	# Fix misplaced systemd unit
	mkdir -pv "$pkgdir"/usr/lib/systemd
	mv -v "$pkgdir"/etc/systemd/system "$pkgdir"/usr/lib/systemd/
	rmdir -v "$pkgdir"/etc/systemd

	# Fix misplaced executable symlink
	mkdir -pv "$pkgdir"/usr/bin
	ln -vsr "$pkgdir"/usr/share/webone/webone "$pkgdir"/usr/bin/webone
	rm -rvf "$pkgdir"/usr/local
	sed -i "s,/usr/local/bin/,/usr/bin/," "$pkgdir"/usr/lib/systemd/system/webone.service

	# Install a static user account to have it own the log file (instead of
	# making it world-writable as the original package does!)
	install -Dm0644 "$srcdir"/webone.sysusers "$pkgdir"/usr/lib/sysusers.d/webone.conf
	install -Dm0644 "$srcdir"/webone.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/webone.conf
	sed -i "s/create 666 root root/create 644 webone webone/" "$pkgdir"/etc/logrotate.d/webone

	# Put the log file in its own directory (reduces logrotate clutter)
	sed -i '/LogFile=/ s,%SYSLOGDIR%/,&webone/,' "$pkgdir"/etc/webone.conf
	sed -i 's,^/var/log/,&webone/,' "$pkgdir"/etc/logrotate.d/webone
	sed -i '/^ReadWriteDirectories=/ s,/var/log/$,&webone/,' \
		"$pkgdir"/usr/lib/systemd/system/webone.service

	# Other systemd unit fixes
	sed -i '/^WantedBy=/ s/\bdefault\.target\b/multi-user.target/' \
		"$pkgdir"/usr/lib/systemd/system/webone.service
}
