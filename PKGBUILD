# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: G. Schlisio <x-git@dukun.de>
# Contributor: Matt Harrison <matt@hallme.com>
# Contributor: Sergey Mamonov <mrqwer88@gmail.com>

pkgname="maldet"
pkgver=2.0.1
pkgrel=1
pkgdesc="Linux malware scanner designed around threats faced in shared host environments"
url="https://www.rfxn.com/projects/linux-malware-detect/"
license=("GPL2")
arch=("any")
provides=("linux-malware-detect")
depends=("ed" "inetutils" "inotify-tools" "perl" "systemd")
source=("https://github.com/rfxn/linux-malware-detect/releases/download/v$pkgver/maldet-$pkgver.tar.gz"
        "maldet-update-signatures.service"
        "maldet-update-signatures.timer")
backup=("etc/maldet/hookscan.conf"
        "etc/maldet/ignore_file_ext"
        "etc/maldet/ignore_inotify"
        "etc/maldet/ignore_paths"
        "etc/maldet/ignore_sigs"
        "etc/maldet/internals.conf"
        "etc/maldet/maldet.conf"
        "etc/maldet/maldet.sysconfig"
        "etc/maldet/monitor_paths"
        "etc/maldet/monitor_paths.extra"
        )
b2sums=('a6c3060963830a6b5d83321b3a292a74b22e78d8dcf69bf78cb2f4fd849b12acb4b8a524c90085531383cc5ef8cc175e6d7513d8ec186b00905ef084e72c8bcf'
        'db8e0e11586fa6eb72d6681807809c9f3f6696fc8cb97af37ff51a30a586fa0ef0fe5640ed3652db2fccf795ee941bde91f71a3b515ade75341433ffc3ca52e6'
        'b00551a7f71181bea51e9df11cb3e241de9536baa6bde20c6047d65452c9187ec4138e7b323b7c70938e3e8c0aee322784652168b00246060f86f55701e4e2af')
install="maldet.install"

prepare(){
 cd "maldet-$pkgver"
 # use arch linux file hierarchy
 sed -i "files/maldet" \
     -e "s|inspath='/usr/local/maldetect'|inspath='/usr/share/maldet'|" \
     -e 's|^intcnf="\$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|'
 sed -i "files/hookscan.sh" \
     -e 's|inspath="\${inspath:-/usr/local/maldetect}"|inspath="${inspath:-/usr/share/maldet}"|'

 # hookscan.conf is now derived from the upstream-shipped default
 cp "files/conf.maldet.hookscan.default" "files/conf.maldet.hookscan"

 sed -i "files/conf.maldet" \
     -e "s|/usr/local/maldetect/monitor_paths.extra|/etc/maldet/monitor_paths.extra|" \
     -e "s|/usr/local/maldetect/monitor_paths|/etc/maldet/monitor_paths|"

 sed -i "files/ignore_inotify" \
     -e 's|\^/usr/local/maldetect\*|\^/var/lib/maldet\*\n\^/usr/share/maldet\*|'

 sed -i "files/ignore_paths" \
     -e "s|/usr/local/maldetect|/var/lib/maldet\n/usr/share/maldet|" \
     -e "s|/usr/local/sbin/maldet|/usr/bin/maldet|"

 sed -i "files/internals/ignore_inotify.defaults" \
     -e "s|/usr/local/maldetect/|/var/lib/maldet/\n/usr/share/maldet/|" \
     -e "s|/usr/local/sbin/maldet|/usr/bin/maldet|"

 sed -i "files/internals/lmd_alert.sh" \
     -e "s|/usr/local/sbin/maldet|/usr/bin/maldet|"

 sed -i "files/internals/importconf" \
     -e 's|INSTALL_PATH="\${INSTALL_PATH:-/usr/local/maldetect}"|INSTALL_PATH="${INSTALL_PATH:-/usr/share/maldet}"|'

 sed -i "files/internals/internals.conf" \
     -e 's|^inspath="\${inspath:-/usr/local/maldetect}"|inspath="${inspath:-/usr/share/maldet}"|' \
     -e 's|^intcnf="\$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|' \
     -e 's|^confpath="\$inspath"|confpath="/etc/maldet"|' \
     -e 's|^cnffile="conf.maldet"|cnffile="maldet.conf"|' \
     -e 's|^varlibpath="\$inspath"|varlibpath="/var/lib/maldet"|' \
     -e 's|^tmpdir="\$inspath/tmp"|tmpdir="$varlibpath/tmp"|'

 sed -i "files/service/maldet.service" \
     -e "s|/usr/local/maldetect/maldet|/usr/bin/maldet|" \
     -e "/^EnvironmentFile=/d" \
     -e "/^\[Service\]/a EnvironmentFile=/etc/maldet/maldet.sysconfig"

 sed -i "files/service/maldet.sysconfig" \
     -e "s|/usr/local/maldetect/monitor_paths|/etc/maldet/monitor_paths|"
}

package(){
 cd "maldet-$pkgver"
 # main executables
 install -d "$pkgdir/usr/bin/"
 install -D -m 755 "files/maldet" "$pkgdir/usr/bin/maldet"
 install -D -m 755 "files/hookscan.sh" "$pkgdir/usr/bin/hookscan"
 ln -s "/usr/bin/hookscan" "$pkgdir/usr/bin/modsec"
 # program files
 install -d "$pkgdir/usr/share/maldet"
 cp -ar "files/"* "$pkgdir/usr/share/maldet"
 # systemd files
 install -D -m 644 "files/service/maldet.service" "$pkgdir/usr/lib/systemd/system/maldet.service"
 install -D -m 644 "$srcdir/maldet-update-signatures.service" "$pkgdir/usr/lib/systemd/system/maldet-update-signatures.service"
 install -D -m 644 "$srcdir/maldet-update-signatures.timer" "$pkgdir/usr/lib/systemd/system/maldet-update-signatures.timer"
 # program data
 install -d -m 750 "$pkgdir/var/lib/maldet/"
 install -d -m 755 "$pkgdir/var/lib/maldet/"{internals,quarantine,sess,sigs,clean,tmp,pub}
 install -d -m 750 "$pkgdir/var/log/maldet"
 # logrotate
 install -D -m 644 "files/logrotate.maldet" "$pkgdir/etc/logrotate.d/maldet"
 # configurations
 # must be readable by those who can execute maldet
 install -d "$pkgdir/etc/maldet"
 install -m 644 "files/conf.maldet" "$pkgdir/etc/maldet/maldet.conf"
 install -m 644 "files/conf.maldet.hookscan" "$pkgdir/etc/maldet/hookscan.conf"
 install -m 644 "files/internals/internals.conf" "$pkgdir/etc/maldet/internals.conf"
 install -m 644 "files/monitor_paths" "$pkgdir/etc/maldet/monitor_paths"
 install -m 644 /dev/null "$pkgdir/etc/maldet/monitor_paths.extra"
 install -m 644 "files/service/maldet.sysconfig" "$pkgdir/etc/maldet/maldet.sysconfig"
 cp -ra "files/"ignore_* "$pkgdir/etc/maldet/"
 # man pages
 install -d "$pkgdir/usr/share/man/man1/"
 gzip -f9 "files/maldet.1"
 install -D -m 644 "files/maldet.1.gz" "$pkgdir/usr/share/man/man1/maldet.1.gz"
 # documentation
 install -d "$pkgdir/usr/share/doc/maldet/"
 install -D -m 644 "CHANGELOG" "$pkgdir/usr/share/doc/maldet/CHANGELOG"
 install -D -m 644 "COPYING.GPL" "$pkgdir/usr/share/license/maldet/COPYING"
 install -D -m 644 "README" "$pkgdir/usr/share/doc/maldet/README"
 # cleanup
 rm -r "$pkgdir/usr/share/maldet/cron"
 rm "$pkgdir/usr/share/maldet/conf.maldet"
 rm "$pkgdir/usr/share/maldet/conf.maldet.cron"
 rm "$pkgdir/usr/share/maldet/conf.maldet.hookscan"
 rm "$pkgdir/usr/share/maldet/conf.maldet.hookscan.default"
 rm "$pkgdir/usr/share/maldet/hookscan.sh"
 rm "$pkgdir/usr/share/maldet/"ignore_*
 rm "$pkgdir/usr/share/maldet/internals/internals.conf"
 rm "$pkgdir/usr/share/maldet/logrotate.maldet"
 rm "$pkgdir/usr/share/maldet/maldet"
 rm "$pkgdir/usr/share/maldet/maldet.1"
 rm "$pkgdir/usr/share/maldet/modsec.sh"
 rm "$pkgdir/usr/share/maldet/monitor_paths"
 rm -r "$pkgdir/usr/share/maldet/service"
 rm "$pkgdir/usr/share/maldet/uninstall.sh"
}
