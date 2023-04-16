# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: G. Schlisio <x-git@dukun.de>
# Contributor: Matt Harrison <matt@hallme.com>
# Contributor: Sergey Mamonov <mrqwer88@gmail.com>

pkgname="maldet"
pkgver=1.6.5
pkgrel=1
pkgdesc="Linux malware scanner designed around threats faced in shared host environments"
url="https://www.rfxn.com/projects/linux-malware-detect/"
license=("GPL2")
arch=("any")
provides=("linux-malware-detect")
depends=("inetutils" "inotify-tools" "perl" "systemd")
source=("https://github.com/rfxn/linux-malware-detect/archive/$pkgver.tar.gz"
        "maldet-update-signatures.service"
        "maldet-update-signatures.timer")
backup=("etc/maldet/hookscan.conf"
        "etc/maldet/ignore_file_ext"
        "etc/maldet/ignore_inotify"
        "etc/maldet/ignore_paths"
        "etc/maldet/ignore_sigs"
        "etc/maldet/internals.conf"
        "etc/maldet/maldet.conf"
        "etc/maldet/monitor_paths"
        )
sha256sums=('23c7cf5649b0f1c1d4e2ab78961eb58453ed01aeffb53926fde6f2baa7f61e68'
            '172486c33905df4032d74dd7f79c6dafce64df2006a037fba3c6aded99eaaba1'
            '0d6d61dadb72eec8ded0d7e97d4b723fd2e4323e68852add59d372ef3f4e7b00')
install="maldet.install"

prepare(){
 ## TODO upstream setup tries to overwrite clamav's rfxn.* and lmd.user.* files
 #  seems to run with root-privs, so check for overwrites anywhere (best in a VM)
 #  file system privileges - depends on root/user
 cd "linux-malware-detect-$pkgver"
 # use arch linux file hierarchy
 sed -i "files/maldet" \
     -e "s|^inspath='/usr/local/maldetect'|inspath='/usr/share/maldet'|" \
     -e 's|^intcnf="\$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|'
 sed -i "files/hookscan.sh" \
     -e "s|^inspath='/usr/local/maldetect'|inspath=\"/usr/share/maldet\"|" \
     -e 's|^intcnf="$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|' \
     -e 's|hookcnf="$inspath/conf.maldet.hookscan"|hookcnf="/etc/maldet/hookscan.conf"|' \
     -e 's|$inspath/maldet|/usr/bin/maldet|' \
     -e 's|tmpdir=/var/tmp|tmpdir=/var/lib/maldet/tmp|'
cat > "files/conf.maldet.hookscan" <<CONTENT
#quarantine_hits=1
#quarantine_clean=0
#scan_tmpdir_paths=''
#hscan=1
CONTENT
 sed -i "files/conf.maldet" \
     -e "s|/usr/local/maldetect/tmp|/var/lib/maldet/tmp|" \
     -e "s|/usr/local/maldetect/monitor_paths|/etc/maldet/monitor_paths|"

 sed -i "files/ignore_inotify" \
     -e 's|\^/usr/local/maldetect\*|\^/var/lib/maldetect\*\n\^/usr/share/maldetect\*|'

 sed -i "files/ignore_paths" \
     -e "s|/usr/local/maldetect|/var/lib/maldet\n/usr/share/maldet|" \
     -e "s|/usr/local/sbin/maldet|/usr/bin/maldet|"
 
 sed -i "files/internals/functions" \
     -e 's|$inspath/maldet|/usr/bin/maldet|'

 sed -i "files/internals/hexfifo.pl" \
     -e "s|/usr/local/maldetect/internals|/usr/share/maldetect/internals|"

 sed -i "files/internals/importconf" \
     -e "s|/usr/local/maldetect/conf.maldet|/etc/maldet/maldet.conf|" \
     -e "s|/usr/local/maldetect/tmp|/var/lib/maldet/tmp|" \
     -e "s|/usr/local/maldetect/monitor_paths|/etc/maldet/monitor_paths|"

 sed -i "files/internals/internals.conf" \
     -e 's|^logdir="\$inspath/logs"|logdir="/var/log/maldet"|' \
     -e 's|^inspath=/usr/local/maldetect|inspath="/usr/share/maldet"|' \
     -e 's|^intcnf="$inspath/internals/internals.conf"|intcnf="/etc/maldet/internals.conf"|' \
     -e 's|^confpath="\$inspath"|confpath="/etc/maldet"|' \
     -e 's|^cnffile="conf.maldet"|cnffile="maldet.conf"|' \
     -e 's|^varlibpath="\$inspath"|varlibpath="/var/lib/maldet"|' \
     -e 's|^tmpdir="\$inspath/tmp"|tmpdir="$varlibpath/tmp"|' \
     -e 's|^inotify_log="\$inspath/logs/inotify_log"|inotify_log="$logdir/inotify_log"|'

 sed -i "files/internals/scan.etpl" \
     -e "s|/usr/local/sbin/maldet|/usr/bin/maldet|"

 sed -i "files/internals/tlog" \
     -e "s|/usr/local/maldetect/tmp|/var/lib/maldet/tmp|"

 sed -i "files/service/maldet.service" \
     -e "s|/usr/local/maldetect/maldet|/usr/bin/maldet|"  \
     -e "s|--monitor /usr/local/maldetect/monitor_paths|--monitor /etc/maldet/monitor_paths|" \
     -e "s|^PIDFile=.*|PIDFile=/var/lib/maldet/tmp/inotifywait.pid|" \
     -e "s|^EnvironmentFile=.*|EnvironmentFile=/etc/maldet/maldet.conf|"
}

package(){
 cd "linux-malware-detect-$pkgver"
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
 install -d "$pkgdir/var/lib/maldet/"{internals,quarantine,sess,sigs,clean,tmp,pub}
 install -d "$pkgdir/var/log/maldet"
 # configurations
 # must be readable by those who can execute maldet
 install -d "$pkgdir/etc/maldet"
 install -m 644 "files/conf.maldet" "$pkgdir/etc/maldet/maldet.conf"
 install -m 644 "files/conf.maldet.hookscan" "$pkgdir/etc/maldet/hookscan.conf"
 install -m 644 "files/internals/internals.conf" "$pkgdir/etc/maldet/internals.conf"
 install -m 644 "files/monitor_paths" "$pkgdir/etc/maldet/monitor_paths"
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
 rm "$pkgdir/usr/share/maldet/hookscan.sh"
 rm "$pkgdir/usr/share/maldet/"ignore_*
 rm "$pkgdir/usr/share/maldet/internals/internals.conf"
 rm "$pkgdir/usr/share/maldet/maldet"
 rm "$pkgdir/usr/share/maldet/maldet.1"
 rm "$pkgdir/usr/share/maldet/modsec.sh"
 rm "$pkgdir/usr/share/maldet/monitor_paths"
 rm -r "$pkgdir/usr/share/maldet/service"
 rm "$pkgdir/usr/share/maldet/uninstall.sh"
}
