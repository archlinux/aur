default: build

prep: clean namcap
	rm -rf Gemfile.lock
	bundle install
	# Fetches latest version info, updates
	# PKGBUILD, and creates a .commit_msg
	bundle exec ruby update.rb

build: prep
	makepkg
	makepkg --printsrcinfo > .SRCINFO

# .commit_msg is created by update.rb,
# if there is a new version.
commit: .commit_msg
	echo "Committing: "
	cat .commit_msg
	git add .SRCINFO
	git add PKGBUILD
	git commit -S -s -F .commit_msg
	rm .commit_msg

clean:
	git clean -fd
	rm -rf pkg src *.deb *.tar.xz

namcap:
	namcap PKGBUILD

# too many failures we can't correct due to PKGBUILD design
shellcheck:
	shellcheck PKGBUILD

vet: namcap shellcheck
