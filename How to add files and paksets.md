# Adding files in the user data directory (~/.local/share/simutrans-extended)

Files in this directory are symlinked from: 

1. `/usr/share/games/simutrans-extended` (shared Simutrans Extended installation)
2. `/.local/share/simutrans` (paksets only, which is in turn symlinked to `/usr/share/games/simutrans` if Simutrans Standard is installed)

This means that the following paksets are already available here:

1. Paksets installed system-wide for Simutrans Extended.
2. Paksets installed system-wide for Simutrans Standard.
3. Paksets installed for Simutrans Standard by you in `/.local/share/simutrans`

If you already have Simutrans Standard installed you probably want to keep installing Simutrans Standard paksets in `~/.local/share/simutrans`, while installing Simutrans Extended paksets here in `~/.local/share/simutrans-extended`. 

Adding paksets to these directories is the only way for non-root users to add paksets. You can also add non-pakset files (fonts, music, etc).

Symlinked files are updated everytime you open the game, so:

1. Don't worry about deleting symlinks by accident.
2. New paksets installed will be picked up automatically.

But please **don't reemplace symlinked files in this directory**.

# Adding files in the user config directory (~/.config/simutrans-extended)

Additionally, you can also add non-pakset files (fonts, music, etc) in `~/.config/simutrans-extended`
