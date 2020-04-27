PROJECT_NAME=sublime-music

all:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf *-any.pkg.tar
	rm -rf *.tar.gz
	rm -rf dist
	rm -rf ${PROJECT_NAME}
