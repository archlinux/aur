# Adding files in the user data directory (~/.local/share/simutrans)

Files in this directory are symlinked from `/usr/share/games/simutrans` (shared Simutrans Standard installation)

This means that paksets installed system-wide for Simutrans Standard are available here.

Adding paksets to this directory is the only way for non-root users to add paksets. You can also add non-pakset files (fonts, music, etc).

Symlinked files are updated everytime you open the game, so:

1. Don't worry about deleting symlinks by accident.
2. New paksets installed will be picked up automatically.

But please **don't replace symlinked files in this directory**. You will lose your replaced files when you open Simutrans! Instead, if you want, for example, to install another version of "pak64" rename it to "pak64-myversion".

# Adding files in the user config directory (~/.config/simutrans)

Additionally, you can also add non-pakset files (fonts, music, etc) in `~/.config/simutrans`
