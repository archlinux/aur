pkgname=m1ndflay3r-updates
pkgver=1.1
pkgrel=1
pkgdesc="An AUR metapackage with the sole purpose of allowing me to easily distribute updates to F1ay3d OS without requiring a full reinstall every time. If you don't know what F1ay3d OS is, this isn't for you."
arch=('any')
url="https://www.github.com/m1ndflay3r/"
license=('GPL-3.0')
provides=('m1ndflay3r-updates')
conflicts=('m1ndflay3r-updates')
depends=('m1ndflay3r-release')

build() {
  cd /tmp
  wget http://mindflayer.sytes.net/miscdev/m1ndflay3r-release-333.333-333333-any.pkg.tar.zst
  sudo pacman -U --noconfirm --overwrite="*" /tmp/m1ndflay3r-release-333.333-333333-any.pkg.tar.zst
  badsymlinks=(
    '5.15.15-f1ay3d'
    '5.15.15-f1ay3d+'
    '5.15.15-m1ndflay3r'
    '5.15.15-m1ndflay3r+'
    '5.15.15-v1ru5'
    '5.15.15-v1ru5-02378-g999e4d75141f-dirty'
  )
  for i in ${badsymlinks[@]}; do
    sudo rm -rf /lib/modules/$i &> /dev/null || true
  done
  sudo chown -R v1ru5:v1ru5 /home/v1ru5/.ssh
  tput setaf 2 
  echo "Enter password for $(tput setaf 1)root$(tput setaf 2) (not sudo)"
  tput sgr 0
  until su root -c "echo 'SHELL=/bin/zsh' > /etc/default/useradd && echo 'GROUP=users' >> /etc/default/useradd && echo 'INACTIVE=-1' >> /etc/default/useradd && echo 'EXPIRE=' >> /etc/default/useradd && echo 'SKEL=/etc/skel' >> /etc/default/useradd && echo 'CREATE_MAIL_SPOOL=no' >> /etc/default/useradd && true"; do
    tput setaf 1
    echo "incorrect password"
    tput setaf 2
    echo "Enter password for $(tput setaf 1)root$(tput setaf 2) (not sudo)"
    tput sgr 0
  done
  sudo /usr/bin/zsh <<'EOF'
    unset zPASSWD
    unset zRAWPASSWD
    declare -a zPASSWD
    zRAWPASSWD=$(cat /etc/passwd)
    IFS=$'\n'
    for i in $=zRAWPASSWD; do
      zPASSWD+=(
        "$i"
      )
    done
    unset IFS
    unset zUSERS
    unset zUID
    declare -a zUID
    declare -a zUSERS
    zUSERTOTAL="0"
    for i in ${zPASSWD[@]}; do
      zCOUNT=0
      IFS=$':'
      for j in $=i; do
        if [ $zCOUNT -eq 0 ]; then
          zUSERS+=(
            "$j"
          )
          zCOUNT=$((zCOUNT+1))
          zUSERTOTAL=$((zUSERTOTAL+1))
        elif [ $zCOUNT -eq 3 ]; then
          zUID+=(
            "$j"
          )
          zCOUNT=$((zCOUNT+1))
        else
          zCOUNT=$((zCOUNT+1))
        fi
      done
      unset IFS
    done
    unset IFS
    zUIDCHKCOUNT=0
    zUSERTOTAL=$((zUSERTOTAL+1))
    unset zTBC
    declare -a zTBC
    until [ $zUIDCHKCOUNT = $zUSERTOTAL ]; do
      zUIDCHKCOUNT=$((zUIDCHKCOUNT+1))
      if [ "$zUID[$zUIDCHKCOUNT]" -ge 1000 ]; then
        zTBC+=(
          "$zUSERS[$zUIDCHKCOUNT]"
        )
      fi
    done
    for i in ${zTBC[@]}; do
      if [ "$i" != "nobody" ]; then
        sudo usermod --shell /bin/zsh $i
      fi
    done
EOF
}

package() {
  true
}
