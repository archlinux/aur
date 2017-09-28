prepare:
	namcap PKGBUILD

build:
	makepkg -csi

rebuild:
	if [ -f "beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz" ]; then sudo rm beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz; fi
	makepkg

check:
	namcap beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz

checkpkg:	
	makepkg --repackage

prepare-push:
	makepkg --printsrcinfo > .SRCINFO	

uploadpkg:
	git add PKGBUILD .SRCINFO beakerbrowser beakerbrowser.desktop beakerbrowser.install LICENSE Makefile

sum_pkg:
	sha256sum beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz > beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz.sha256

check_sum_pkg:
	sha256sum -c beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz.sha256

install_pkg:
	sudo -v;
	#Offline installation of packages test
	sudo pacman -U beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz

clean:
	sudo -v;
	if [ -d "beaker" ]; then sudo rm -r beaker; fi
	if [ -d "pkg" ]; then sudo rm -r pkg; fi
	if [ -d "src" ]; then sudo rm -r src; fi
	if [ -f "beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz" ]; then sudo rm beakerbrowser-0.7.5-1-x86_64.pkg.tar.xz; fi