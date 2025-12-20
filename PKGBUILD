#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=makepkg-git-lfs-proto
pkgver=3
pkgrel=1
pkgdesc='Add Git-lfs support to makepkg. Use "git-lfs+" as protocol specifier in source url.'
arch=('any')
license=('GPL')
url='https://github.com/bartoszek/AUR-makepkg-git-lfs-proto'
depends=('pacman' 'git-lfs')
source=(git-lfs.sh.in)
sha256sums=('18c00ffd81f2216acbe6a1cac47b2a3a648cdfa029c6fd07e60eb43a3e9c7adb')

prepare() {
  # How to check for the unlikely possiblity that the directory was changed?
  sed -i "s|@libmakepkgdir@|/usr/share/makepkg|g" "${source[@]}"
  for file in "${source[@]}"; do mv "$file" "${file%.in}"; done

  # Use the current makepkg config as a base
  cp /etc/makepkg.conf ./makepkg-git-lfs.conf

  # Add git-lfs to VCSCLIENTS list
  sed -i "/^VCSCLIENTS/a\            'git-lfs::git-lfs'" makepkg-git-lfs.conf
}

package() {
  install -m755 -D -t "${pkgdir}"/usr/share/makepkg/source/ "${source[@]%.in}"
  install -m644 -D -t "${pkgdir}"/etc/ makepkg-git-lfs.conf
}
