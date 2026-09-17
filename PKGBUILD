# Maintainer: Max Roder <maxroder@mailbox.org>
# Based on grml-systemd-boot by Nicolas Stalder <n+archlinux@stalder.io>
#
# grml as a systemd-boot entry directly on the ESP (kernel, initrd, squashfs
# under /boot/grml), a second "toram" entry, a custom grml-autoconfig
# configuration under /boot/scripts (boot option "scripts") and a helper to
# build /boot/config.tbz (boot option "config"). See the migration runbook, 1l.
#
# The ESP needs ~700 MB of free space for this flavour. For the complete
# grml system (ISO ~1.1 GB) see the package grml-systemd-boot-full.

pkgname=grml-systemd-boot-small
_flavour=small
pkgver=2026.09
pkgrel=1
pkgdesc="grml-$_flavour live system as systemd-boot loader entry on the ESP, with grml-autoconfig scripts"
url="https://wiki.archlinux.org/title/Systemd-boot#Grml_on_ESP"
# The package ships an amd64 kernel, initrd and squashfs, so it is not "any".
arch=(x86_64)
# The packaging scripts are GPL-2.0-or-later. The grml ISO itself aggregates
# software under many licenses; see /usr/share/doc inside the live system.
license=('GPL-2.0-or-later')
depends=(systemd)
provides=(grml-systemd-boot)
# grml-systemd-boot (AUR, by nickray) uses the same paths on the ESP, and the
# two flavours here overwrite each other's /boot/grml files: all mutually exclusive.
conflicts=(grml-systemd-boot grml-systemd-boot-full)
install=$pkgname.install
backup=(
	boot/loader/entries/grml.conf
	boot/scripts/grml.sh
	etc/grml-config-update.conf
)
optdepends=('sbctl: sign the grml kernel for Secure Boot')

_iso=grml-$_flavour-$pkgver-amd64.iso
# arch-install-scripts (arch-chroot, genfstab, pacstrap) is not part of grml.
# Architecture "all" and pure shell, so the version is independent of the grml
# release and is not bumped with it. Taken from snapshot.debian.org because
# deb.debian.org drops a pool file as soon as a newer version enters sid,
# which would break this PKGBUILD; snapshot URLs are immutable.
_ais=arch-install-scripts_31-1_all.deb
_ais_url=https://snapshot.debian.org/archive/debian/20260903T000000Z/pool/main/a/arch-install-scripts
source=(
	https://download.grml.org/$_iso
	https://download.grml.org/$_iso.asc
	$_ais_url/$_ais
	grml.conf
	grml.sh
	wpa.conf.example
	grml-config-update
	grml-config-update.conf
)
noextract=($_iso $_ais)
# Michael Prokop <mika@grml.org>, signs the grml release ISOs
validpgpkeys=('33CCB136401AFEC843A3876396A87872B7EA3737')
sha256sums=('81062142e320b158dcac541506e74e1b4d77f409e72bf7ef52820fc881d72c33'
            '6f969c5f684a532261a3b4b180181ae31f311ed994d6c3dd5ea76b6a062f40d5'
            '17d6b437fbb538b8c9b45d8cc85483fa2a34d9649faeba1850954ab700cfa536'
            '76feb18f40202755af803c3bd5f500f821d9542946064aca25ccff4cc0aa9d24'
            '22bb6e536e6f87e393711268fc2b14d89725238bbc2ad98732500a1770b551b3'
            '8eb2d8fd95345cd373551e41b3fdc7081216c7aa4ba3f669d8604b882785d37c'
            'd8bd452801bb38d92d35809c0e68ab42343ec152b6d8207ff0d260851cf05435'
            'c38dcfddf5fa01adcf6f66fa0e993a6115d836091d2a6490ed385d60e36eeb51')

prepare() {
	# Extract only the three live files from the ISO instead of unpacking
	# the whole image. The directory names inside the ISO vary by release and
	# flavour (boot/grmlfullamd64, boot/grmlsmallamd64, ...), hence wildcards.
	rm -rf live
	mkdir -p live
	bsdtar -xf "$_iso" -C live \
		'boot/*/vmlinuz' \
		'boot/*/initrd.img' \
		'live/*/*.squashfs'
	for f in vmlinuz initrd.img; do
		[ "$(find live/boot -name "$f" | wc -l)" = 1 ] || { echo "==> ERROR: $f not found exactly once in $_iso" >&2; return 1; }
	done
	[ "$(find live/live -name '*.squashfs' | wc -l)" = 1 ] || { echo "==> ERROR: squashfs not found exactly once in $_iso" >&2; return 1; }
}

package() {
	# Live system: /grml/ is the live-media-path in grml.conf.
	install -d "$pkgdir/boot/grml"
	install -m644 "$(find live/boot -name vmlinuz)"    "$pkgdir/boot/grml/vmlinuz"
	install -m644 "$(find live/boot -name initrd.img)" "$pkgdir/boot/grml/initrd.img"
	install -m644 "$(find live/live -name '*.squashfs')" "$pkgdir/boot/grml/"

	# systemd-boot entry. Deliberately no "toram" variant, see the comment in grml.conf.
	install -Dm644 grml.conf "$pkgdir/boot/loader/entries/grml.conf"

	# grml-autoconfig: boot option "scripts" runs /scripts/grml.sh from the
	# boot medium (= the ESP). wpa.conf with the WLAN PSK does not belong in
	# the package, only the template; grml.sh starts WLAN only if wpa.conf exists.
	install -Dm755 grml.sh          "$pkgdir/boot/scripts/grml.sh"
	install -Dm644 wpa.conf.example "$pkgdir/boot/scripts/wpa.conf.example"

	# Boot option "debs": grml-autoconfig runs "dpkg -i <medium>/debs/*.deb"
	# before the "scripts" stage, so arch-chroot and genfstab are available in
	# the live system. The package has no dependencies of its own. pacstrap
	# comes with it but needs pacman, which grml does not ship.
	install -Dm644 "$_ais" "$pkgdir/boot/debs/$_ais"

	# Helper that rebuilds /boot/config.tbz (boot option "config") from a path list
	install -Dm755 grml-config-update      "$pkgdir/usr/bin/grml-config-update"
	install -Dm644 grml-config-update.conf "$pkgdir/etc/grml-config-update.conf"
}
